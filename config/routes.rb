Rails.application.routes.draw do
  resources :books, only: [:index, :create, :show]
end
