Rails.application.routes.draw do
  devise_for :users
  resources :zakazs
  resources :pages
  root 'pages#main'

end
