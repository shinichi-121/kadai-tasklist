Rails.application.routes.draw do
  get 'task/index'
  get 'tasklists/index'
  get 'tasks/index'
  root to: 'tasks#index'

  resources :tasks
end
