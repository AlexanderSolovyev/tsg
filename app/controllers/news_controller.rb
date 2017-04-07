class NewsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :auth_admin!, except: [:index]
  before_action :new_find, only: [:edit, :update, :destroy]
  def index
    @news=New.all.order(created_at: :desc)
  end
  def edit 
  end
  def update 
    if @new.update(new_params)
      redirect_to news_index_path
    else
      render :edit
    end
  end
  def new
    @new= New.new
  end
  def create
   @new= New.new(new_params)
   if @new.save
      redirect_to news_index_path
   else
     render :new
   end
  end
  def destroy
    @new.destroy
    redirect_to news_index_path
  end
   private
   def new_params
     params.require(:new).permit(:title, :description, :date)
   end
   def new_find
    @new=New.find(params[:id])
   end
   def auth_admin!
      redirect_to news_index_path unless user_signed_in? and current_user.admin 
   end
end
