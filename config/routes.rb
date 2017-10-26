Rails.application.routes.draw do

  resources :listings do
    resources :bids, only: [:create, :new, :destroy]
  end
  
  get 'landing/index'

  root 'landing#index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
