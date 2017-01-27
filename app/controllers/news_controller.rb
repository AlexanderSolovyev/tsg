class NewsController < ApplicationController
  def index
    @news=New.all
  end
  def edit
  end
end
