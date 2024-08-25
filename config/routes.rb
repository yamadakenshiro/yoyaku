Rails.application.routes.draw do
  root to:"tops#index"
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  get "users/show" => "users#show"
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :rooms do
    collection do
      get 'search' => 'rooms#search'
    end
  end
  resources :reservations, except: [:show] do
    get "reservations/index" => "reservations#index"
    member do
      post 'confirm', to: 'reservations#confirm'
    end
  end
  
end
