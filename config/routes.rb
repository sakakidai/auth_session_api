Rails.application.routes.draw do
  get "/", to: redirect("/api/v1/welcome")
  namespace :api do
    namespace :v1 do
      post '/signin', to: 'auth#create'
      post '/signup', to: 'registrations#signup'
      resources :users, only: :index
    end
  end
end
