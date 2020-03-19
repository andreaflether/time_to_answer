Rails.application.routes.draw do
  namespace :admins_backoffice do
    resources :admins
    get 'welcome/index'
  end

  namespace :site do
    get 'welcome/index'
  end

  namespace :users_backoffice do
    get 'welcome/index'
  end
  
  devise_for :users
  devise_for :admins

  get 'inicio', to: 'site/welcome#index'

  root 'site/welcome#index'
end
