Rails.application.routes.draw do

  devise_for :users
  resources :coffees do
    collection do
      get :my
      get :market
    end
  end
  resources :devise
  root to: "coffees#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
