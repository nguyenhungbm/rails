Rails.application.routes.draw do
  resources :questions
  devise_for :users
  root "static_pages#index"
  get "static_pages/show"
  get "static_pages/new"
  get "static_pages/edit"
  resources :users
  resources :microposts, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
  get '/comments/new/(:parent_id)', to: 'comments#new', as: :new_comment
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
