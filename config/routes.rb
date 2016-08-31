Rails.application.routes.draw do
  root :to => 'articles#index'
  resources :articles do
    resources :comments
  end
  resources :users
  resource :session
  get '/login' => "sessions#new", :as => "login"
  get '/loginout' => "sessions#destroy", :as => "logout"
end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
