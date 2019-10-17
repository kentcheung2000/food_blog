Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only:[:new, :create]

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  resources :outings, only: [:new, :create, :show, :destroy, :index]

  # get('/', {to: 'users#index', as: 'root'})

end
