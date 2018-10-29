Rails.application.routes.draw do
  root 'events#index'
  resources :events
  resources :attendances, only: [:create, :destroy]
  devise_for :users, path: '/', path_names: { sign_up: 'register', sign_in: 'login', sign_out: 'logout', edit: ':username/edit' }
  resources :users, only: [:show]
  resources :users, only: [:index]
  resources :users, param: :username, only: [:show], path: '/', as: "username"
  get 'tags/:tag', to: 'events#index', as: :tag
end
