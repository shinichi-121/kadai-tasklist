Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/create'
  get 'tasks/index'
  get 'tasks/show'
  get 'tasks/new'
  get 'tasks/create'
  get 'task/index'
  get 'task/show'
  get 'task/new'
  get 'task/create'
  get "tasks/path"
  # get 'task/index'
  # get 'task/show'
  # get 'task/new'
  # get 'task/create'
  # get 'task/index'
  # get 'tasklists/index'
  # get 'tasks/index'
  root to: 'tasks#index'
  
  get "signup", to:"users#new"
  resources :tasks
  resources :users, only: [:index,:show,:new,:create]
end
