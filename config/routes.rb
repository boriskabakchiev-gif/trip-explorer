Rails.application.routes.draw do
  root "trips#index"

  get "trips/index"

  namespace :api do
    namespace :v1 do
      resources :trips, only: [:index, :show, :create]
    end
  end
end