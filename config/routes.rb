Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      mount ActionCable.server => '/cable'
      resources :users, only: [:index, :create, :show, :update, :destroy]
      resources :rooms
      resources :messages
      resources :friendships
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      # get 'my_friends/:current_user_id', to: 'friendships#my_friends'
      # resources :tasks, only: [:index, :show, :create, :update]
      # resources :tasks, only: [:index, :create, :show, :update, :destroy]
      # resources :bids, only: [:index, :create, :show, :update, :destroy]
    end
  end
end
