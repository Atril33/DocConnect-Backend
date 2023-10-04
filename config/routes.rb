Rails.application.routes.draw do
  get 'specializations/index'
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :user, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  }, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }

  namespace :api do
    namespace :v1 do
      resources :appointments, only: [:index, :show, :create, :update, :destroy]
      resources :doctors, only: [:index, :show, :create, :destroy]
      resources :specializations, only: [:index]
      get 'current_user', to: 'current_user#index'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
