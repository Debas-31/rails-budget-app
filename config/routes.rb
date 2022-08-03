Rails.application.routes.draw do
  get 'expenses/index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :groups, only: [:index, :new, :create]
  # Defines the root path route ("/")
  root "home_page#index"
end
