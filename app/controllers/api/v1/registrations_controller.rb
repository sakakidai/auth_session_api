class Api::V1::RegistrationsController < ApplicationController
  def signup
    user = User.new(registrations_params)

    if user.save
      render json: { user: user, message: '新規会員登録が完了しました' }, status: :created
    else
      render json: { errors: user.errors, message: 'バリデーションエラーがあります' }, status: :unprocessable_entity
    end
  end

  private

  def registrations_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
