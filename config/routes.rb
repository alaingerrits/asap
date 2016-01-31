Rails.application.routes.draw do

  resources :after_signup
  
  authenticated :user do
  	root to: "backlogitems#index", as: :authenticated_root
  end

  unauthenticated do
  	root to: 'visitors#index'
  end
  
  devise_for :users
  resources :users
  resources :backlogitems

end
