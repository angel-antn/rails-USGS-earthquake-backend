class AuthController < ApplicationController
  before_action :authenticate_request

  private
  def authenticate_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    if header
      decoded = JsonWebToken.jwt_decode(header)
      @current_user = User.find(decoded[:user_id])
    else
      render json: { error: 'Authorization header not found' }, status: :unauthorized
      return
    end
  end
end
