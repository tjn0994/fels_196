Rails.application.routes.draw do
  namespace :admin do
    root "static_pages#home"
    resources :categories, except: :show
    resources :courses, except: :show
    resources :lessons do
      resources :words, except: [:new, :show]
      resources :questions, except: [:new, :show]
    end
  end

  root "static_pages#home"
  get "/sign_up", to: "users#new"
  post "/sign_up", to: "users#create"
  resources :users, only: [:new, :create]
end
