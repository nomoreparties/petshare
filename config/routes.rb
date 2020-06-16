Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users
  resources :pets
  resources :posts
  resources :users do
    post :follow
    post :unfollow
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
