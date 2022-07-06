Rails.application.routes.draw do
  devise_for :users

  root to: "reservations#index"
  # resources :reservations
  resources :reservations do
    member do
     get 'new2'
    end 
  end  
end

# get 'reservations/index'
# get 'plans/index'