class Admin::UserRequestsController < Admin::ApplicationController
  def index
    @user_requests=UserRequest.all
  end
  def show
  end
  def destroy
    @user_request=UserRequest.find(params[:id])
    @user_request.destroy
    redirect_to  admin_user_requests_path
  end
end
