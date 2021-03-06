Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:show, :new, :create]
  
  resources :items, only: [:new]
  get 'test', to: 'google_auth#redirect'
  
  resources :relationships, only: [:create,:destroy]
  
  get 'ranking/remind', to: 'rankings#remind'
  
end
