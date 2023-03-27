Rails.application.routes.draw do
  root 'static_pages#index'
  get 'static_pages/show'
  get 'static_pages/new'
  get 'static_pages/edit'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
