Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root 'sessions#welcome'

  get 'signup' => 'users#new'
  post 'signup' => 'users#create'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

  get '/auth/:provider/callback' => 'sessions#omniauth'

  resources :users
  resources :rsvps
  resources :categories
  resources :events

end
