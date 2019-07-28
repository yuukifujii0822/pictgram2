Rails.application.routes.draw do
  
  get 'sessions/new'
  root "pages#index"
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  resources :users
  resources :topics
  
  get 'favorites/index'
  post "favorites/:topic_id/create",  to: "favorites#create"
  post "favorites/:topic_id/destroy",  to: "favorites#destroy"
  
end
