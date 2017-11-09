Rails.application.routes.draw do  

  resources :listings, except: :index do
    resources :bids, only: [:create, :new, :destroy] do
      member do
        post :confirm
      end
    end
  end
  
  get 'landing/index'

  root 'landing#index'

  devise_for :users, controllers: {registrations: 'registrations'}
  resources :users, :only => [:show] do
    member do
      get :profile
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
