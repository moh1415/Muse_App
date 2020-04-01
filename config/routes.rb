Rails.application.routes.draw do
  devise_for :users
  #root 'artists#index'
  get 'pages/index'
  resources :artists, :songs
  get "bootstrap", to: "artists#bootstrap"
  get "bootstrap", to: "users#bootstrap"
  root 'pages#index'
  # get "artists", to: "artists#index"
  # get "artists/:id", to: "artists#show", as: :artist
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
