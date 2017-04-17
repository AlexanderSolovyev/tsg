class UserRequestsController < ApplicationController
  before_action :authenticate_user!
  def index
  end
  def new
    @user_request=UserRequest.new
  end
  def create
    @user_request=UserRequest.new(user_request_params)
    @user_request.user=current_user
    @user_request.save
    redirect_to news_index_path
  end
  private
  def user_request_params
    params.require(:user_request).permit(:text)
  end
end
