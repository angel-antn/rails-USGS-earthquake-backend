require "jwt"

module JsonWebToken
  SECRET_KEY = Rails.application.credentials.secret_key_base

  def self.jwt_encode(payload, exp = 7.days.from_now) 
    JWT.encode(payload, SECRET_KEY)
  end

  def self.jwt_decode(token) 
    decoded = JWT.decode(token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new decoded
  end
end
