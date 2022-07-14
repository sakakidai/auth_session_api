Rails.application.routes.draw do
  get "/", to: redirect("/api/v1/welcome")
  namespace :api do
    namespace :v1 do
      namespace :auth do
        resources :sessions, only: :index
        post '/signin', to: 'sessions#create'
        post '/signup', to: 'registrations#signup'
        delete '/signout', to: 'sessions#destroy'
      end
      resources :users, only: :index
    end
  end
end
