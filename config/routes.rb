Rails.application.routes.draw do
  root 'products#welcome_show'
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

  resources :orders do
    member do
      post :pay_with_alipay
      post :pay_with_wechat
      post :apply_to_cancel
    end
    resources :product_list
  end

  resources :carts do
    collection do
      delete :clean
      post :checkout
    end
  end

  resources :products do
    collection do
      get :welcome_show
    end
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
    resources :product_lists
    resources :orders do
      resources :products
    end
  end

  resources :services
  resources :abouts
  resources :cart_items
end
