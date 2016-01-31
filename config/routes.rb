Rails.application.routes.draw do
  
  authenticated :user do
  	root to: "users#index", as: :authenticated_root
  end

  unauthenticated do
  	root to: 'visitors#index'
  end
  
  devise_for :users
  resources :users
  
end
