Rails.application.routes.draw do
  resources :options_controllers

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  devise_for :admins, path: 'admins', controllers: {
    sessions: 'admins/sessions'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :admin do
    resources :coupons
    resources :dashboard
    resources :categories
    resources :products
    resources :lists
    resources :options
    root to: "dashboard#index"
  end

  root "welcome#index"
  get "/shop", to: "welcome#shop"
  get "/about", to: "welcome#about"
  get "/wishlist", to: "welcome#wishlist"
  get "/cart", to: "welcome#cart"

  #Profile
  get "/profile", to: "profile#index"
  get "/profile/orders", to: "profile#order"
  get "/profile/reviews", to: "profile#reviews"
  get "/profile/wishlist", to: "profile#wishlist"
  get "/profile/manage", to: "profile#manage"

end
