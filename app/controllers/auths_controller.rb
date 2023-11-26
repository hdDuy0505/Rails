# frozen_string_literal: true
class AuthsController < ApplicationController
  skip_before_action :authenticate_request

  def login
    begin
      command = AuthenticateUser.call(login_params[:email], login_params[:password])
      render json: { access_token: command.result[:access_token], **command.result[:user] }

    rescue ActiveRecord::RecordInvalid => e #  Error: Validation failed
      render json: { error: e.message }, status: :authenticate
    rescue => e
      p "Error register user: " + e.message
      render json: { error: e.message }, status: :internal_server_error
    end
  end

  def register
    begin
      user = User.find_by_email(register_params[:email])
      if user.nil?
        user = User.create!(register_params)
        access_token = JsonWebToken.encode(user.attributes.except("password_digest", "created_at", "updated_at"))
        render json: { access_token: access_token,
                       **user.attributes.except("password_digest", "created_at", "updated_at") }, status: :ok
      else
        render json: { error: "Email already exists" }, status: :bad_request
      end

    rescue ActiveRecord::RecordInvalid => e #  Error: Validation failed
      render json: { error: e.message }, status: :bad_request
    rescue => e
      p "Error register user: " + e.message
      render json: { error: e.message }, status: :internal_server_error
    end
  end

  private
  def login_params
    params.require(:auth).permit(:email, :password)
  end

  def register_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
