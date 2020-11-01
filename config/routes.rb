Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items do
    resources :orders, only: [:index, :create]
    resources :comments, only: :create
    resources :favorites, only: [:create, :destroy]
    collection do
      get 'search'
    end
    resources :reports, only: [:index, :new, :create] do
    end
  end
  get 'category' => 'items#category'
  resources :users, only: [:show, :edit, :update] do
    get 'favorite' => 'users#favorite'
    get 'sell' => 'users#sell'
  end
end