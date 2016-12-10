Rails.application.routes.draw do

  scope :api do
    resources :users, except: [:create]
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
