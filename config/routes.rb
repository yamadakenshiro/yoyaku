Rails.application.routes.draw do
  root to:"tops#index"
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  get "users/show" => "users#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :edit, :update]
  resources :rooms
  resources :reservations do
    collection do
      post :confirm
    end
  end
  
end
