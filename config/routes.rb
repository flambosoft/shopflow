Rails.application.routes.draw do
  devise_for :users
  devise_for :admins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :admin do
    resources :dashboard
    resources :categories
    root to: "dashboard#index"
    resources :products
    resources :lists
    get "dashboard", to: "dashboard#index"
  end

  root "welcome#index"
  get "/shop", to: "welcome#shop"
  get "/about", to: "welcome#about"
  get "/which_list", to: "welcome#which_list"
  get "/cart", to: "welcome#cart"

  #Profile
  get "/profile", to: "profile#index"
  get "/profile/orders", to: "profile#order"
  get "/profile/reviews", to: "profile#reviews"
  get "/profile/which_list", to: "profile#which_list"
  get "/profile/manage", to: "profile#manage"

end
