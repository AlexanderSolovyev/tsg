require 'rails_helper'

RSpec.describe NewsController, type: :controller do
  describe  'GET #index' do
    let(:news) { create_list(:new, 2) }
    before do
      get :index
    end

    it 'populates an array of all news' do
    expect(assigns(:news)).to match_array(news)
    end

    it 'render index view' do
    expect(response).to render_template :index
    end
  end
  describe 'GET #new' do
    before { get :new}
    it 'assigns a new new to @new' do
      expect(assigns(:new)).to be_a_new(New)
    end
    it 'render a new view' do
      expect(response).to render_template :new
    end
  end

end
