Rails.application.routes.draw do
  root to:"tops#index"
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :rooms
  resources :reservations do
    collection do
      post :confirm
    end
  end
  
end
