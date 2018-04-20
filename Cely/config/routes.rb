Rails.application.routes.draw do
  devise_for :users
  resources :documents


  namespace :v1, defaults: { format: :json } do

  	resources :sessions, only: [:create, :destroy]
    resources :registrations, only: [:create]
    resources :noticias, only: [:create, :index]
    post 'sessions/fb', to: 'sessions#fb'
    post 'noticias/add', to: 'noticias#add'
    get 'noticias/getLines', to: 'noticias#getLines'



  end



  root 'documents#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
