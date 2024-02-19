# Dans le mailer `user_mailer.rb`
class UserMailer < ApplicationMailer
    def send_login_credentials(user, password)
      @user = user
      @password = password
      mail(to: @user.email, subject: 'Your login credentials for the application')
    end
  end
  