require "hash_converter"

class Api::V1::RegistrationsController < ApplicationController
  skip_before_action :require_login
  
  def signup
    user = User.new(registrations_params)

    if user.save
      user_attributes = user.attributes.with_indifferent_access.slice(:name, :email)
      render json: { user: HashConverter.to_camel_case(user_attributes), message: '新規会員登録が完了しました' }, status: :created
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
