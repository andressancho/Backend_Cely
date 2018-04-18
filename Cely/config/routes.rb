Rails.application.routes.draw do
  devise_for :users
  resources :documents


  namespace :v1, defaults: { format: :json } do

  	resources :sessions, only: [:create, :destroy]
    resources :registrations, only: [:create]
    post 'sessions/fb', to: 'sessions#fb'


  end



  root 'documents#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
