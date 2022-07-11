class ApplicationController < ActionController::API
  include ActionController::Cookies
  include ActionController::Helpers

  before_action :require_login
  before_action :check_xhr_header
  helper_method :login!, :current_user

  def login(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  private

  def require_login
    return if current_user

    render json: { message: 'unauthorized' }, status: :unauthorized
  end

  # CSRF対策として、リクエストヘッダ X-Requested-With: 'XMLHttpRequest' の存在を判定する
  def check_xhr_header
    return if request.xhr?
    render status: :forbidden, json: { status: 403, error: "Forbidden" }
  end

  # Internal Server Error
  def response_500(message = "Internal Server Error")
    render status: :internal_server_error, json: { status: 500, error: message }
  end
end
