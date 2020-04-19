Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "dashboard#index"


  # logins
  resources :logins, only: %i[create]
  get "/login", to: "logins#new", as: :new_logins

  # sessions
  delete "/sessions", to: "sessions#destroy", as: :destroy_sessions
  get "/sessions/:login_token", to: "sessions#create", as: :sessions

  # registrations
  resources :registrations, only: %i[create], as: :registrations
  get "/register", to: "registrations#new", as: :new_registrations

  resources :statuses, only: [:index, :new, :create]
end
