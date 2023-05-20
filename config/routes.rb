Rails.application.routes.draw do
  devise_for :users do
    resources :sales, only: [:new, :create]
  end
  resources :coffees do
    resources :sales, only: [:new, :create]
  end
  root to: "coffees#index"
  resources :sales
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  #merge
  # Defines the root path route ("/")
  # root "articles#index"
end
