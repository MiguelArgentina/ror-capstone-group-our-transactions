Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #
  resources :users, only: [:new, :create, :edit, :update, :show, :destroy]
  resources :groups, only: [:new, :create, :edit, :update, :show, :destroy, :index]
  resources :activities, only: [:new, :create, :edit, :update, :show, :destroy, :index]
  root 'sessions#login'



  #routes to handle sessions:
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'
end
