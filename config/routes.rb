Rails.application.routes.draw do
  root 'events#index'
  devise_for :users, path: '/', path_names: { sign_up: 'register', sign_in: 'login', sign_out: 'logout', edit: ':username/edit' }
  resources :users, only: [:show]
  resources :users, only: [:index]
  resources :users, param: :username, only: [:show], path: '/', as: "username"
  resources :events
  resources :attendances, only: [:create, :destroy]
  get 'tags/:tag', to: 'events#index', as: :tag
end
