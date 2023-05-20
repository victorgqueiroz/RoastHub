Rails.application.routes.draw do
  resources :devise
  devise_for :users
  resources :sales, only: [:index, :show]

  resources :coffees do
    resources :sales, only: [:create]
    collection do
      get :my
      get :market
    end
  end
  root to: "coffees#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
