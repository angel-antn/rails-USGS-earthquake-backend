class Api::UsersController < ApplicationController
  def login
    @user = User.find_by(email: params[:email])
    if @user&.authenticate(params[:password])
      token = JsonWebToken.jwt_encode(user_id: @user.id)
      render json: {token: token, user: @user.as_json(except: :password_digest)}, status: :ok
    else
      render json: {error: 'Invalid email or password'}, status: :unauthorized
    end
  end

  def register
    @user = User.new(email: params[:email], name: params[:name], lastname: params[:lastname], password: params[:password])
    if @user.save
      token = JsonWebToken.jwt_encode(user_id: @user.id)
      render json: {token: token, user: @user.as_json(except: :password_digest)}, status: :ok
      return;
    end

    render json: {error: 'Email must be an unique valid email and password must be 6 characters min. All fields are required'}, status: :bad_request
  end
end
