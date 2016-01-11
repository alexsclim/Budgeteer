Rails.application.routes.draw do
  root 'static_pages#home'
  get 'static_pages/settings'
  get 'static_pages/budget'
end
