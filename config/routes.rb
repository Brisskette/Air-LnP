Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'


  resources :lands, only: [ :new, :create, :show, :index ]

  resources :lands do
    resources :bookings, only: [ :new, :create ]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
