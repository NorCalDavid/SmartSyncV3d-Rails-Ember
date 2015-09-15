Backend::Application.routes.draw do

  get "assets/index"

  resources :users, except: [:new, :edit]
  post 'session' => 'session#create'

end
