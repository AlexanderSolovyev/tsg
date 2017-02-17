require 'rails_helper'

RSpec.describe NewsController, type: :controller do
  

  describe  'GET #index' do
    before { get :index }
    let(:news) { create_list(:new, 2) }
    it 'populates an array of all news' do
      expect(assigns(:news)).to match_array(news)
    end
    it 'render index view' do
    expect(response).to render_template :index
    end
  end

  describe 'GET #new' do
      login_user
      before { get :new }
    it 'assigns a new new to @new' do
      expect(assigns(:new)).to be_a_new(New)
    end
    it 'render a new view' do
      expect(response).to render_template :new
    end
  end

  describe 'GET #Edit' do
    let(:new) {create :new}
      login_user
      before {get :edit, params: {id: new}}
    it 'assigns the requested new to @new' do
    expect(assigns(:new)).to eq new
    end
    it 'render a edit view' do
      expect(response).to render_template :edit
    end
  end


  describe 'POST #create' do
    login_user
    it ' add valid new in database' do
    old_count=New.count
    post :create, params:{ new: attributes_for(:new)}
    expect(New.count).to eq old_count +1
    end
    it 'if valid then redirect to news_path' do
      post :create , params: { new: attributes_for(:new)}
      expect(response).to redirect_to news_index_path
    end
    it 'not add invalid new in database' do
      expect {post :create, params: { new: attributes_for(:invalid_new)}}.to_not change(New, :count)
    end
    it 're-render form if not save' do
      post :create, params: { new: attributes_for(:invalid_new)}
      expect(response).to render_template :new
    end
  end

  describe 'PATCH #update' do
    let(:new) {create :new}
    login_user
    context 'valid attributes' do
      it 'assign update attributes to @new' do
        patch :update, params: { id: new, new: attributes_for(:new)}
        expect(assigns(:new)).to eq new
      end
      it 'write valid in db' do
        patch :update , params: { id: new, new: { title: 'this title', description: 'this description'}}
        new.reload
        expect(new.title).to eq 'this title'
        expect(new.description).to eq 'this description'
      end
      it 'redirect to news' do
        patch :update, params: { id: new, new: attributes_for(:new)}
        expect(response).to redirect_to news_index_path 
      end
    end
    context 'invalid atrributes' do
      it 'dont change invalid in db' do
        patch :update, params: {id:new, new: { title: '', description: '' }}
        new.reload
        expect(new.title).to eq 'MyTitle'
        expect(new.description).to eq 'MyDescription'
      end
      it ' render new if not write in db' do
        patch :update, params: {id:new, new: { title: '', description: '' }}
        expect(response).to render_template :edit
      end
    end
  end 


  describe 'DELETE #desroy' do
    let(:new) {create :new}
    login_user
    it ' destroy new' do
      new
      expect { delete :destroy, params: {id: new}}.to change(New, :count).by(-1)
    end
    it 'redirect to news' do
      delete :destroy, params: {id: new}
      expect(response).to redirect_to news_index_path
    end
  end
end
