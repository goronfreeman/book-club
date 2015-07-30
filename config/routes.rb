Rails.application.routes.draw do
  root 'static_pages#home'
  match 'resources', to: 'static_pages#resources', via: :get
  match 'notes', to: 'static_pages#notes', via: :get
  match 'code-review', to: 'static_pages#code_review', via: :get
  match 'calendar', to: 'static_pages#calendar', via: :get
  devise_for :users, controllers: { registrations: 'registrations' }
end
