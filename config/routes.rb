Rails.application.routes.draw do

  scope :api do

  get 'items/search', to: 'products_search#search_products'

  resources :users, except: [:create]
  post 'gardens/:id/like', to: 'gardens#like'
  post 'gardens/:id/unlike', to: 'gardens#unlike'
  resources :gardens
  resources :items
  resources :images
  resources :comments
  resources :tiles
  resources :designs

  post 'register', to: 'auth#register'
  post 'login', to: 'auth#login'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
