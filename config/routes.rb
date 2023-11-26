# frozen_string_literal: true
Rails.application.routes.draw do
  resources :books, only: [:index, :create, :show, :update] do
    collection do
      put '/update-book-comment', to: 'books#update_book_comment'
    end
  end

  namespace :auths do
    post '/login', to: 'auths#login'
    post '/register', to: 'auths#register'
  end
end
