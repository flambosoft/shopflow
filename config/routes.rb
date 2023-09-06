Rails.application.routes.draw do
  devise_for :users
  devise_for :admins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :admin do
    root to: "dashboard#index"
    resources :products
    get "dashboard", to: "dashboard#index"
  end

  root "welcome#index"
  get "/shop", to: "welcome#shop"
  get "/about", to: "welcome#about"
  get "/wishlist", to: "welcome#wishlist"
  get "/profile", to: "profile#index"

end
