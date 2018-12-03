Rails.application.routes.draw do
  resources :bands
  resources :comments
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :demos do
  	resources :comments
  end
  root 'home#index'
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
