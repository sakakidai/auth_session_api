require "hash_converter"

class Api::V1::AuthController < ApplicationController
  skip_before_action :require_login

  def create
    user = User.find_by(email: auth_params[:email])
    if user && user.authenticate(auth_params[:password])
      login(user)
      render json: { message: 'ログインしました' }, status: :ok
    else
      render json: {  
        message: 'パスワードとメールアドレスが正しくありません' 
      }, status: :unprocessable_entity
    end
  end

  private

  def auth_params
    params.require(:user).permit(:email, :password)
  end
end
