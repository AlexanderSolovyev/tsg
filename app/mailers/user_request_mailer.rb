class UserRequestMailer < ApplicationMailer
  def user_request(user_email,text)
    @user_email=user_email
    @text=text
    mail(to: 'dom10_2014@mail.ru', subject: "#{user_email} oтправил вам письмо")
  end  
end
