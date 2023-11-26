# frozen_string_literal: true
require 'jwt'

class JsonWebToken
  ALGORITHM = 'HS256'
  class << self
    def encode(payload, exp = 24.hours.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, auth_secret, ALGORITHM)
    end

    def decode(token)
      body = JWT.decode(token, auth_secret, true, { algorithm: ALGORITHM })[0]
      HashWithIndifferentAccess.new(body)
      rescue
        nil
    end

    def auth_secret
      ENV["SECRET_KEY"]
    end
  end
end
