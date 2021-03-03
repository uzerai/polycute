# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # Execution calls; something that will cause an 'action' on the server.
  post 'execute/:function_name', \
      to: 'execution#execute', as: 'execution'


  # Functionality listing and registration, for managing possible executions.
  post 'functionality', to: 'functionality#register', as: 'register'
  put 'functionality', to: 'functionality#update', as: 'update'
  get 'functionality', to: 'functionality#index', as: 'view_registrations'
	delete 'functionality/:id', to: 'functionality#destroy', as: 'destroy_functionality'


  # Application functionality metadata endpoints.
  get '/', to: 'application#root', as: 'version-check'
end
