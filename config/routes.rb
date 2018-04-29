Rails.application.routes.draw do
  resources :resumes
  # get 'admins/index'

  # get 'admins/show'

  # get 'admins/new'

  # get 'admins/edit'

  # get 'admins/destroy'

  resources :users
  resources :admins # -> model admin == (# get 'admins/index' - get 'admins/show' - get 'admins/new' - get 'admins/edit' - get 'admins/destroy')
  # get 'learning/index'
  # get 'learning/home'
  root 'learning#home'

  match ':controller(/:action(/:id))',:via=> :get

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
