Rails.application.routes.draw do
  root "task_lists#index"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  resources :users, only: [:new, :create]
  resources :task_lists, only: [:index]
end
