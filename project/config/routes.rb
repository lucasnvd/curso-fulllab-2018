Rails.application.routes.draw do
  root 'home#index'

  # para filtrar actions, vc pode utilizar o except ou only
  # ex:
  # resources :users, only: [:index, :show]
  # resources :users, except: [:destroy, :create, :update]

  namespace :api do
    namespace :v1 do
      resources :beers, only: :index

      resources :users, only: :index do
        resources :orders, except: [:edit, :new]
      end
    end
  end

  resources :providers
  resources :beers
  resources :users
end
