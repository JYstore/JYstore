Rails.application.routes.draw do
  root 'products#index'
  devise_for :users

  namespace :admin do
    resources :products
    resources :categories
    resources :orders do
      member do
        post :cancel
        post :ship
        post :shipped
        post :return
      end
    end
    resources :users
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :carts do
    collection do
      delete :clean
      post :checkout
    end
  end

  resources :products do
    member do
      post :add_to_cart
    end
  end

  resources :payments do
    member do
      get :completed
    end
  end

  namespace :account do
    resources :orders
  end


  resources :cart_items
end
