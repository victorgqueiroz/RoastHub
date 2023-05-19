Rails.application.routes.draw do

  devise_for :users
  resources :coffees
  resources :devise
  # get "market", to: "market#show"
  resources :markets
  root to: "coffees#index"
  get "edit", to: "coffees#update"

  resources :coffees do
    collection do
      get :my
    end
  end
  root to: "coffees#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
