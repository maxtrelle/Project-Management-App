Rails.application.routes.draw do
  get 'pages/home'
  get 'pages/about'
  get 'pages/contacts'
  resources :projects do
    resources :tasks
  end
  
  devise_for :users

  root to: "projects#index"
end
