Rails.application.routes.draw do
  namespace :admins_backoffice do
    get 'welcome/index'  # Dashboard
    resources :admins    # Administradores
    resources :subjects  # Assuntos/Áreas
    resources :questions # Perguntas
  end

  namespace :site do
    get 'welcome/index'
    get 'search', to: 'search#questions'                                            # Procurar por palavra-chave
    get 'subject/:subject_id/:subject', to: 'search#subject', as: 'search_subject'  # Procurar por área 
    post 'answer', to: 'answer#question'                                            # Submissão de respostas
  end

  namespace :users_backoffice do
    get 'welcome/index'
    get 'profile', to: 'profile#edit'
    patch 'profile', to: 'profile#update'
  end
  
  devise_for :users
  devise_for :admins, skip: [:registrations]

  get 'inicio', to: 'site/welcome#index'
  get 'admin', to: 'admins_backoffice/welcome#index'

  root 'site/welcome#index'
end
