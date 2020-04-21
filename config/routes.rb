Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  devise_scope :user do
    get 'users/home', to:'devise/registrations#index'
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root 'top_page#index'
  
  resources :users, only: [:show]
  resources :items, only: [:new, :create, :destroy, :edit, :update, :show]
    resources :items do    
      get :purchase, on: :member  
      post :payment, on: :member
      #Ajaxで動くアクションのルートを作成
      collection do
        get 'category/get_category_children', to: 'items#get_category_children', defaults: { format: 'json' }
        get 'category/get_category_grandchildren', to: 'items#get_category_grandchildren', defaults: { format: 'json' }
      end
    end
    get "complete", to: "items#complete"
    
  resources :exhibition, only: [:index]
  get 'exhibition/index'
  resources :cards, only: [:new, :index, :destroy]
  post "pay", to: "cards#pay"
end
