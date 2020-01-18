Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create, :show, :update, :destroy]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      # resources :tasks, only: [:index, :show, :create, :update]
      # resources :tasks, only: [:index, :create, :show, :update, :destroy]
      # resources :bids, only: [:index, :create, :show, :update, :destroy]
    end
  end
end
