Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root 'events#index'

  get 'signup' => 'users#new'
  post 'signup' => 'users#create'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

  get '/auth/google_oauth2/callback' => 'sessions#omniauth'

  resources :users
  resources :rsvps
  resources :categories do
    resources :events, shallow: true
  end
  resources :events do 
    resources :rsvps, shallow: true
  end

end

