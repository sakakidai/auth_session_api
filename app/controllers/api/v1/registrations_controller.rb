require "hash_converter"

class Api::V1::RegistrationsController < ApplicationController
  def signup
    user = User.new(registrations_params)

    if user.save
      render json: { user: HashConverter.to_camel_case(user), message: '新規会員登録が完了しました' }, status: :created
    else
      render json: { 
        errors: HashConverter.to_camel_case(user.errors.full_message_with_attribute), 
        message: 'バリデーションエラーがあります' 
      }, status: :unprocessable_entity
    end
  end

  private

  def registrations_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
