Rails.application.routes.draw do
  root 'users#home'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'

  resources :sessions
  resources :users, :attractions do
    resources :rides
  end

  resources :rides
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
