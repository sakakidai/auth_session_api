require "hash_converter"

class Api::V1::Auth::SessionsController < ApplicationController
  skip_before_action :require_login

  def index
    if current_user
      user_attributes = current_user.attributes.with_indifferent_access.slice(:name, :email)
      render json: { user: HashConverter.to_camel_case(user_attributes) }, status: :ok
    else
      render json: { message: 'unauthorized' }, status: :unauthorized
    end
  end

  def create
    user = User.find_by(email: auth_params[:email])
    if user && user.authenticate(auth_params[:password])
      login(user)
      user_attributes = user.attributes.with_indifferent_access.slice(:name, :email)
      render json: { user: HashConverter.to_camel_case(user_attributes), message: 'ログインしました' }, status: :ok
    else
      render json: {  
        message: 'パスワードとメールアドレスが正しくありません' 
      }, status: :unprocessable_entity
    end
  end

  def destroy
    reset_session
    render json: { status: :ok, message: 'ログアウトしました' }
  end

  private

  def auth_params
    params.require(:user).permit(:email, :password)
  end
end
