Rails.application.routes.draw do
  namespace :admin do
    root "static_pages#home"
    resources :categories
    resources :courses
    resources :lessons
  end

  root "static_pages#home"
end
