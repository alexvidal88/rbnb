Rails.application.routes.draw do
  get 'dashboard', to: 'pages#dashboard'
  devise_for :users
  root to: 'pages#home'

  resources :socks, except: [:edit, :update] do
    resources :bookings
  end
  resources :bookings, only: :destroy do
    resources :reviews, only: [:create, :new]
  end
end
