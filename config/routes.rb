Rails.application.routes.draw do
  resources :place_orders
  resources :line_items
  resources :carts
  root 'pages#home'
  get 'index', to: 'store#index'
  resources :products do
    get :who_bought, on: :member
  resources :users, except: [:new]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
