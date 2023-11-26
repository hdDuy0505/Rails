# frozen_string_literal: true
class AuthenticateUser
  prepend SimpleCommand

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    result = nil
    if user
      profile = user.attributes.except("password_digest", "created_at", "updated_at")
      access_token = JsonWebToken.encode(profile)
      result = {
          access_token: access_token,
          user: profile
      }
    end
    result
  end

  private

  attr_accessor :email, :password

  def user
    user = User.find_by_email!(email)
    return user if user && user.authenticate(password)

    errors.add :user_authentication, 'invalid credentials'
    nil
  end
end
