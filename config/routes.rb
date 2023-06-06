Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  resources :posts do
    resources :comments, only: [:create, :edit, :update, :destroy]
  end
  #get 'home/index'
  root 'home#index'
end
