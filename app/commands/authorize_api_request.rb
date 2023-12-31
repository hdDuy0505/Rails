# frozen_string_literal: true
class AuthorizeApiRequest
  prepend SimpleCommand

  def initialize(headers = {})
    @headers = headers
  end

  def call
    user
  end

  private attr_reader :headers

  private def user
    @user ||= User.find(decoded_auth_token[:id]) if decoded_auth_token
    @user || errors.add(:token, 'Invalid token') && nil
  end

  private def decoded_auth_token
    @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
  end

  private def http_auth_header
    if headers['Authorization'].present?
      return headers['Authorization'].split(' ').last
    else
      errors.add(:token, 'Missing token')
    end
    nil
  end
end
