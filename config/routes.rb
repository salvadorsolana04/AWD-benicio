Rails.application.routes.draw do
  get "users/new"
  get "users/create"
  resource :session
  resources :passwords, param: :token
  resource :unsubscribe, only: [ :show ]
  resources :users, only: [ :new, :create ]


  resource :cart, only: [ :show, :destroy ]
  resources :cart_items, only: [ :create, :destroy ]

  resources :products do
    resources :subscribers, only: [ :create ]
  end

  root "products#index"
end
