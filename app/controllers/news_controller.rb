class NewsController < ApplicationController
  def index
    @news=New.all
  end
  def edit 
    @new=New.find(params[:id])
  end
end
