Rails.application.routes.draw do
  root 'welcome#home'
  resources :users
  resources :attractions, only: [:index, :show, :new, :create, :edit, :update]
  get '/attractions/:id/destroy', to: 'attractions#destroy', as: 'delete_attraction'
  patch '/attractions/:id/ride', to: 'attractions#ride', as: 'ride'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
