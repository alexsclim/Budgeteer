Rails.application.routes.draw do
  root                  'static_pages#home'
  get   'settings', to:  'static_pages#settings'
  get   'budgets',  to:  'static_pages#budgets'
  get   'contact',  to:  'static_pages#contact'
  get   'signup',   to:  'users#new'
  get   'login',    to:  'sessions#new'
  post  'login',    to:  'sessions#create'
  delete'logout',   to:  'sessions#destroy'
  resources :users,               only: [:show, :new, :create, :edit, :update]
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
end
