Rails.application.routes.draw do
  
  resources :appointments 
  get "appointments_search", to: "appointments#appointments_search"
  
  resources :pets
  resources :doctors
  root 'users#home'
  get 'register', to: 'users#register'
  get 'edit_account/:id', to:'users#edit_account'
  post 'users/create', to: 'users#create'
  
  get 'login', to: 'users#login'
  post 'login', to: 'users#create_session'
  get 'logout', to: 'users#logout'
end
