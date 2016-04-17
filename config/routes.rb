Rails.application.routes.draw do
  authenticated :user do
    root to: 'budgets#index', as: :authenticated_root
  end

  root to: 'visitors#index'
  devise_for :users
  resources :budgets
  resources :users

  get 'contact', to: 'static_pages#contact'
end
