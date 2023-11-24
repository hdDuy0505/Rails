# frozen_string_literal: true
Rails.application.routes.draw do
  resources :books, only: [:index, :create, :show, :update]

  namespace :auths do
    post '/login', to: 'auths/#login'
    post '/register', to: 'auths/#register'
  end
end
