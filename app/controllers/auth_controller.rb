require 'authorization.rb'

class AuthController < ApplicationController
  def create
    auth_object = Authentication.new(login_params)
    user = User.find_by(email: params['email'])
    if auth_object.authenticate
      render json: {
        message: "Login successful!", token: auth_object.generate_token, email: user.email}, status: :ok
    else
      render json: {
        message: "Incorrect email/password combination"}, status: :unauthorized
    end
  end

  def show
    authorization_object = Authorization.new(request)
    current_user = authorization_object.current_user
    user = User.find(current_user)
    if current_user 
     render json: UserSerializer.new(user).to_serialized_json
   else
     render json: {error: 'Invalid Token'}, status: 401
    end
  end

  private 
  def login_params
    params.require(:auth).permit(:password, :email)
  end
end