Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'news#index'
  resources :news
  resources :info, only: [:index]
  resources :docs, only: [:index, :new, :create, :edit, :update, :destroy]
end
