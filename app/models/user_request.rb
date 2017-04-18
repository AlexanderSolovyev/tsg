class UserRequest < ApplicationRecord
  belongs_to :user
  after_create :send_notification
  private
  def send_notification
    UserRequestMailer.user_request(self.user.email,self.text).deliver_now
  end
end
