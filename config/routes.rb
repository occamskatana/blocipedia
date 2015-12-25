Rails.application.routes.draw do
  
 resources :wikis
 resources :charges, only: [:new, :create]

 resources :collaborators, except: [:update, :edit, :show, :index]
  root 'welcome#index'

  get 'welcome/about'
  devise_for :users
  resources :users, only: [:show, :update]
end
