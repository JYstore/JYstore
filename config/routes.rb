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
  end

  resources :carts do
    collection do
      delete :clean
      post :checkout
    end
  end

  resources :products do
    collection do
      get :search
    end
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
    resources :orders
  end

  resources :services do
    collection do
      get :protect
    end
    collection do
      get :guardianship
    end
    collection do
      get :contact_information
    end
  end
  resources :abouts
  resources :cart_items
end
