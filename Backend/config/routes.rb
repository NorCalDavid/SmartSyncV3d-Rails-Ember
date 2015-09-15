Backend::Application.routes.draw do


  resources :users, except: [:new, :edit]
  post 'session' => 'session#create'

  root to: "static#index"

  namespace :api do
    namespace :v1 do

      get :csrf, to: 'csrf#index'

      resources :users do
        member do
          get 'properties' => 'users#properties', as: :myproperties
          get 'rooms' => 'users#rooms', as: :myrooms
          get 'devices' => 'users#devices', as: :mydevices
        end
      end

      resources :properties do
        resources :rooms
        resources :devices
      end

    end
  end
end
end
