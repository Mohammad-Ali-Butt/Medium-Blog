Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root "posts#index"

  resources :posts do
    resources :comments
  end
 
  get '/like/:id', to: 'likes#like', as: 'like'
  get '/unlike/:id', to: 'likes#unlike', as: 'unlike'
end
