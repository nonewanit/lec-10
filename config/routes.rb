Rails.application.routes.draw do
  get 'main/login'
  post 'main/create'
  get 'main/destroy'
  get 'main/user_items'
  get 'main/inventories'
  get 'shop/:id', to: 'shop#main', as: 'shop_main'
  post 'shop/:id/:bid/buy', to: 'shop#buy', as: 'shop_buy'
  resources :inventories
  resources :items
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end