Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users

  root to: 'restaurants#index'

  devise_scope :user do
    get 'users/sign_out', to: 'devise/sessions#destroy'
  end

  get "dishes/search", to: "dishes#search"
  resource :users
  resources :restaurants do
    resources :dishes
  end
  resources :categories
  resources :carts
  resources :cart_items
  resources :orders, only: [:index, :create, :show, :destroy]
end
