Rails.application.routes.draw do
  get 'sessions/new'

  root              'static_pages#home'
  get   'settings' => 'static_pages#settings'
  get   'budgets'  => 'static_pages#budgets'
  get   'contact'  => 'static_pages#contact'
  get   'signup'   => 'users#new'
  get   'login'    => 'sessions#new'
  post  'login'    => 'sessions#create'
  delete'logout'   => 'sessions#destroy'
  resources :users
end
