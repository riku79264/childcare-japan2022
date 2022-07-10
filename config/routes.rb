Rails.application.routes.draw do
  devise_for :users

  root to: "reservations#index"
  resources :reservations do
    collection do
     get :standard
     get :advanced
     get :calender
    end 

  end  
end

