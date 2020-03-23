Rails.application.routes.draw do
  namespace :admins_backoffice do
    get 'welcome/index'  # Dashboard
    resources :admins    # Administradores
    resources :subjects  # Assuntos/Áreas
    resources :questions # Perguntas
  end

  namespace :site do
    get 'welcome/index'
    get 'search', to: 'search#questions'
    post 'answer', to: 'answer#question'
  end

  namespace :users_backoffice do
    get 'welcome/index'
  end
  
  devise_for :users
  devise_for :admins

  get 'inicio', to: 'site/welcome#index'

  root 'site/welcome#index'
end
