Rails.application.routes.draw do

  root to: 'users#index'

  devise_for :users, controllers: {
      registrations: 'users/registrations'
  }

  resources :users, only: :show
  resources :questions do
    resources :comments, only: [:create, :update, :destroy]
  end
end