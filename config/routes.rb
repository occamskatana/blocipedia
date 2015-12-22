Rails.application.routes.draw do
  
 resources :wikis

  root 'welcome#index'

  get 'welcome/about'
  devise_for :users
  
end
