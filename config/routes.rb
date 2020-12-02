Rails.application.routes.draw do
  #Home
  root 'home#home'

  devise_for :users

  #Allows view of all albums and all songs
  resources :songs
  resources :albums



  #allow /contact to direct to contact page
  get 'contact', to: 'home#contact'

  #direct after contact form filled in
  post 'request_contact', to:'home#request_contact'
end
