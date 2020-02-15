# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'execute/:function_name', \
      to: 'execution#execute', as: 'execution'

  post 'functionality', to: 'functionality#register', as: 'register'
  get 'functionality', to: 'functionality#index', as: 'view_registrations'
end
