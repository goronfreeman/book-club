Rails.application.routes.draw do
  root 'static_pages#home'
  match 'resources', to: 'static_pages#resources', via: :get
  match 'notes', to: 'static_pages#notes', via: :get
  devise_for :users, controllers: { registrations: 'registrations' }
end
