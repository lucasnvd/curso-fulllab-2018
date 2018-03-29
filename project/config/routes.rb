Rails.application.routes.draw do
  root 'home#index'

  # para filtrar actions, vc pode utilizar o except ou only
  # ex:
  # resources :users, only: [:index, :show]
  # resources :users, except: [:destroy, :create, :update]
  #

  resources :providers
  resources :beers
  resources :users do
    collection do
      get 'my_action', action: :my_action
    end
  end
end
