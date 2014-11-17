Rails.application.routes.draw do
  devise_for :users
  resources :videos do
    resources :comments, controller: 'video/comments', only: [:create]
  end
  root 'videos#index'
end
