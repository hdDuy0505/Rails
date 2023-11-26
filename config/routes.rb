# frozen_string_literal: true
Rails.application.routes.draw do
  resources :books, only: [:index, :create, :show, :update] do
    collection do
      put '/update-book-comment', to: 'books#update_book_comment' # url books/update-book-comment
    end

    member do
      put '/update-book-comment', to: 'books#update_book_comment' # url books/:id/update-book-comment
    end
  end

  resources :comments, only: [:create, :update]

  post '/auths/login', to: 'auths#login'
  post '/auths/register', to: 'auths#register'
end
