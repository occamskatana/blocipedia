Rails.application.routes.draw do
  
 resources :wikis
 resources :charges, only: [:new, :create]


  root 'welcome#index'

  get 'welcome/about'
  devise_for :users
  resources :users, only: [:show, :update]
end
