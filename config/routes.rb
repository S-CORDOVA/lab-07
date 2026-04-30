Rails.application.routes.draw do
  root "owners#index"

  resources :owners
  resources :pets
  resources :vets
  resources :appointments do
    resources :treatments, only: [:new, :create, :edit, :update, :destroy]
  end
end