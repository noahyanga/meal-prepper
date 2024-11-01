Rails.application.routes.draw do
  get "about/index"
  get "home/index"
  get "stores/index"
  get "stores/show"
  get "ingredients/index"
  get "ingredients/show"
  get "recipes/index"
  get "recipes/show"
  get "meals/index"
  get "meals/show"
  get 'about', to: 'about#index'
  
  resources :meals, only: %i[index show] do
    collection do
      get 'search', to: 'meals#search'
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