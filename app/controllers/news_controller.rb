class NewsController < ApplicationController
  def index
    @news=New.all.reverse
  end
  def edit 
    @new=New.find(params[:id])
  end
  def update 
    new= New.find(params[:id])
    new.update!(new_params)
    redirect_to news_index_path
  end
  def new
    @new= New.new
  end
  def create
    New.create(new_params)
    redirect_to news_index_path
  end
  def destroy
    new=New.find(params[:id])
    new.destroy
    redirect_to news_index_path
  end

   private
   def new_params
     params.require(:new).permit(:title, :description)
   end
end
