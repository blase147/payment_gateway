Rails.application.routes.draw do
  resources :products
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :payments, only: [:new, :create]
  resources :products, only: [:index, :show]

  # root 'payments#new'
  root 'products#new'
end
