Rails.application.routes.draw do
  authenticated :user, ->(user) {user.admin?} do
    get 'admin', to: 'admin#index'
    get 'admin/categories', to: 'admin#categories'
    post 'admin/categories', to: 'admin#create_category'
    get 'admin/posts'
    get 'admin/comments'
    get 'admin/users'
    get 'admin/show_post/:id', to: 'admin#show_post', as: 'admin_post'
    get 'admin/show_comment/:id', to: 'admin#show_comment', as: 'admin_comment'
  end

  get 'profile/show/:id', to: 'profile#show', as: 'user_profile'

  devise_for :users, :controllers => { registrations: 'users/registrations' }
  
  post 'posts/validate_post_password/:id', to: 'posts#validate_post_password'
  get 'posts/validate_post_password/:id', to: 'posts#enter_post_password', as: 'validate_post_password'

  resources :posts do
    resources :comments, only: [:create, :edit, :update, :destroy]
  end
  #get 'home/index'
  root 'home#index'
end
