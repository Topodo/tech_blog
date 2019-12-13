Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'
  resources :posts
  resources :topics
  resources :topic do
    resources :posts
  end
  get 'user/:id/posts' => 'users#show'
  resources :users, only: [:show]
  resources :user do
    resources :posts
  end
end
