Rails.application.routes.draw do

  root 'static_pages#home'
  get 'shorten_urls/new'
  get 'shorten_urls/show'
  get 'shorten_urls/jump'
  get "shorten_urls/jump/:id" => 'shorten_urls#jump'
  post 'shorten_urls/create'
  get 'shorten_urls/delete'
  get 'sessions/new'
  get '/help' ,to:'static_pages#help'
  get '/about' ,to:'static_pages#about'
  get '/contact' ,to:'static_pages#contact'
  get '/signup' ,to:'users#new'
  post '/signup' ,to:'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  
  get '/:id' => 'shorten_urls#jump'

  
  resources :users
end
