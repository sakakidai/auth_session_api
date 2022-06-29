class Api::V1::RegistrationsController < ApplicationController
  def signup
    binding.b
    user = User.new(registrations_params)

    if user.save
      render json: { status: :created, user: user }
    else
      render json: { status: :unprocessable_entity, errors: user.errors }
    end
  end

  private

  def registrations_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
