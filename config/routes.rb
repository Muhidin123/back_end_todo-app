Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:create]
  resources :notes
  post '/auth', to: 'auth#create'
  get '/current_user', to: 'auth#show'
  root to: 'notes#index'

end
