Rails.application.routes.draw do
  #get 'comments/index'
  get 'users/index'
  #get 'dashboard/index'
  devise_for :users
  root 'welcome#index'
  resources :dashboard
  resources :books do
    resources :comments 
    resources :trades
  end
 
  
  match '/users',   to: 'users#index',   via: 'get'
  match '/users/:id',     to: 'users#show',       via: 'get'
  match '/books/:id/trades/:id/approve', to: 'trades#approve', via: 'get'
  match '/books/:id/trades/:id/deny', to: 'trades#deny', via: 'get'
  #devise_for :users, :path_prefix => 'd'
  resources :users, :only =>[:show]   
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
