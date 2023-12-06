# frozen_string_literal: true
class AuthenticateUser
  # prepend SimpleCommand

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    if user
      profile = user.attributes.except("password_digest", "created_at", "updated_at")
      access_token = JsonWebToken.encode(profile)
      profile.except!(:exp)
      {
        user: profile,
        access_token: access_token
      }
    end
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
