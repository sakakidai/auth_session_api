class ApplicationController < ActionController::API
  include ActionController::Cookies
  include ActionController::Helpers

  before_action :require_login
  helper_method :login!, :current_user

  def login(user)
      session[:user_id] = user.id
  end

  def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    binding.b
    return if current_user

    render json: { message: 'unauthorized' }, status: :unauthorized
  end
end
