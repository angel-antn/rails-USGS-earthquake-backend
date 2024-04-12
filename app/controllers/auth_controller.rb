class AuthController < ApplicationController
  before_action :authenticate_request

  private
  def authenticate_request
    header = request.headers['Authorization']
    if header && header.start_with?('Bearer ')
      token = header.split(' ').last
      begin
        decoded = JsonWebToken.jwt_decode(token)
        @current_user = User.find(decoded[:user_id])
      rescue JWT::DecodeError
        render json: { error: 'Invalid JWT token' }, status: :unauthorized
      rescue JWT::ExpiredSignature
        render json: { error: 'Expired JWT token' }, status: :unauthorized
      rescue JWT::VerificationError
        render json: { error: 'JWT token verification failed' }, status: :unauthorized
      end
    else
      render json: { error: 'Authorization header must start with Bearer' }, status: :unauthorized
    end
  end  
  
end
