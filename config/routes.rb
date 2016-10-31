Rails.application.routes.draw do
  namespace :admin do
    root "static_pages#home"
    resources :categories
    resources :courses
  end

  root "static_pages#home"
  get "/sign_up", to: "users#new"
  post "/sign_up", to: "users#create"
  resources :users, only: [:new, :create]
end
