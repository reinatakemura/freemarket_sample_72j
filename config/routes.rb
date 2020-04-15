Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  devise_scope :user do
    get 'users/home', to:'devise/registrations#index'
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root 'top_page#index'
  resources :users, only: [:new]
  resources :items, only: [:create,:destroy]
  resources :cards, only: [:new, :show] do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
    end
  end
  get 'exhibition/index'
  get "items/sample_show", to: "items#sample_show"
  get "items/sample_show2", to: "items#sample_show2"
end

