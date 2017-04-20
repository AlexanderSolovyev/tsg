Rails.application.routes.draw do
  resources :user_requests
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'news#index'
  namespace :admin do
    resources :news
    resources :docs
  end
  resources :news, only: [:index]
  resources :info, only: [:index]
  resources :docs, only: [:index, :new, :create, :edit, :update, :destroy]
end
