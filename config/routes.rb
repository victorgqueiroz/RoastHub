Rails.application.routes.draw do

  devise_for :users
  resources :coffees do
    collection do
      get :my
    end
  end
  resources :devise
  resources :markets
  root to: "coffees#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  #merge
  # Defines the root path route ("/")
  # root "articles#index"
end
