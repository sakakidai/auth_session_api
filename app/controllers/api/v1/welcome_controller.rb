class Api::V1::WelcomeController < ApplicationController
  def index
    render json: 'Welcome to demo auth with session.'
  end
end
