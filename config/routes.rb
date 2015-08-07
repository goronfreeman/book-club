Rails.application.routes.draw do
  root 'static_pages#home'
  match 'notes', to: 'static_pages#notes', via: :get
  match 'code-review', to: 'static_pages#code_review', via: :get
  resources :events
  resources :resources
  devise_for :users, controllers: { registrations: 'registrations' }
end
