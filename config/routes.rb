Rails.application.routes.draw do
  devise_for :users

  root to: "plans#index"
  resources :plans
  resources :reservations
end

# get 'reservations/index'
# get 'plans/index'