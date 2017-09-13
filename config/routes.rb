Rails.application.routes.draw do

  # namespace :users do
  #   get 'omniauth_callbacks/facebook'
  #   get 'omniauth_callbacks/twitter'
  #   get 'omniauth_callbacks/google'
  # end

  root to: 'questions#index'

  devise_for :users, controllers: {
      registrations: 'users/registrations'
      # omniauth_callbacks: "users/omniauth_callbacks"
  }

  resources :users, only: :show
    resources :questions, shallow: true do
    resources :comments, only: [:create, :update, :destroy] do
      resources :votes, only: [:create, :update, :destroy]
    end
    resources :votes, only: [:create, :update, :destroy]
  end
end