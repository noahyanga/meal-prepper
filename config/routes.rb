Rails.application.routes.draw do
  get "home/index"
  get "store/index"
  get "store/show"
  get "ingredient/index"
  get "ingredient/show"
  get "recipe/index"
  get "recipe/show"
  get "meal/index"
  get "meal/show"
  
  resources :meals, only: %i[index show] do
    collection do
      get 'search', to: 'meal#search'
    end
  end
  
  resources :recipes, only: %i[index show]
  resources :ingredients, only: %i[index show]
  resources :stores, only: %i[index show]
  
  get 'search', to: 'home#search', as: 'search' # This is for the general search

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root to: "home#index"
end