Rails.application.routes.draw do
  devise_for :users
  resources :videos, only: [:index, :show, :new, :create] do
    resources :comments, controller: 'video/comments', only: [:create]
  end
  root 'videos#index'
end
