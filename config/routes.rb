Rails.application.routes.draw do
  resources :declarations
  resources :reviews
  resources :professors
  resources :admin_user_mfa_session, only: [:new, :create]
  root to: 'professors#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
