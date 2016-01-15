Rails.application.routes.draw do
  get 'users/new'

  root              'static_pages#home'
  get 'settings' => 'static_pages#settings'
  get 'budgets'  => 'static_pages#budgets'
  get 'contact'  => 'static_pages#contact'
end
