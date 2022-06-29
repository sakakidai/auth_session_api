Rails.application.routes.draw do
  get "/", to: redirect("/api/v1/welcome")
  namespace :api do
    namespace :v1 do
      post '/signup', to: 'registrations#signup'

      resources :welcome, only: :index
    end
  end
end
