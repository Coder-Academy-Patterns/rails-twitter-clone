Rails.application.routes.draw do
  resources :tweets
  devise_for :users

  # Set my home page to the list of tweets
  root 'tweets#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
