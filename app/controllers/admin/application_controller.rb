class Admin::ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout 'admin/application'
  before_action :authenticate_user!
  before_action :auth_admin!
  private
   def auth_admin!
      redirect_to news_index_path unless user_signed_in? and current_user.admin 
   end
end
