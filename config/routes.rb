# frozen_string_literal: true

Rails.application.routes.draw do
  resources :specializations
  resources :appointments
  resources :doctors
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
