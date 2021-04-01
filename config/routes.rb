Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      # get '/users/:id/get_interactions', to: 'users#get_interactions'
    end
  end
  
  resources :important_dates
  resources :notes
  resources :interactions
  resources :friends

end
