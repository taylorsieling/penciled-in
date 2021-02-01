Rails.application.routes.draw do
  resources :rsvps
  resources :categories
  resources :events
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root 'welcome#home'

  get '/auth/:provider/callback' => 'sessions#omniauth'

  resources :users

end
