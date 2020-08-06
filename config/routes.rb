Rails.application.routes.draw do
  root 'home#top'
  get 'home/about'
  devise_for :users

  resources :users,only: [:show,:index,:edit,:update] do
    resources :relationships, only: [:create]
    get 'follows' => "users#follows", as: "follows_user"
    get 'followers' => "users#followers", as: "followers_user"
  end
  delete 'users/:user_id/relationships' => "relationships#destroy", as: "user_relationship"
  
  resources :books do
  	resources :book_comments, only: [:create, :destroy]
  	resource :favorites, only: [:create, :destroy]
  end


end