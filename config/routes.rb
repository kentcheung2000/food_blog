Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end
  
  resources :users, only:[:new, :create]

  resources :outings, only: [:new, :create, :show, :destroy, :index]

  get('/', {to: 'sessions#new', as: 'root'})

end
