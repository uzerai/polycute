# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :registration, only: %i[create update delete]
  resolve('registration') { route_for(:registration) }

  post 'functionality/:function_name', \
      to: 'functionality#execute', as: 'execution'

  resources :functionality, only: [:index]
  resolve('functionality') { route_for(:functionality) }
end
