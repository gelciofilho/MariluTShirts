Rails.application.routes.draw do
  root 'pages#home'
  resources :place_orders
  resources :line_items
  resources :carts
  resources :users, except: [:new]
  get 'index', to: 'store#index'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :products do
    get :who_bought, on: :member
  end 
end
