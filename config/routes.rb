Rails.application.routes.draw do
  resources :devise
  devise_for :users do
    resources :sales, only: [:show]
  end
  resources :coffees do
    resources :sales, only: [:show]
    collection do
      get :my
      get :market
    end
  end
  root to: "coffees#index"
  resources :sales
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
