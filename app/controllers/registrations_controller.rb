require_relative '../services/email_service'
class RegistrationsController < ApplicationController
    def create
      role = params[:role]
      user = User.new(
        email: params[:email],
        password: generate_random_password,
        password_confirmation: params[:password_confirmation],
        role: role
      )
  
      if user.save
        send_confirmation_email(user)
        session[:user_id] = user.id
        render json: { status: :created, user: user }
      else
        render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    private
  
    def generate_random_password
      SecureRandom.hex(8)
    end
  
    def send_confirmation_email(user)
      EmailService.send_email(user.email, "Confirmation de compte", "Voici vos informations de connexion : Email: #{user.email}, Mot de passe: #{user.password}")
    end
  end
  