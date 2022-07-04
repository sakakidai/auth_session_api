class Api::V1::UsersController < ApplicationController
  def index
    render json: {message: 'ユーザ一覧にアクセス出来ました'}, status: :ok
  end
end
