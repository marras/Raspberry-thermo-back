get '/', to: 'home#index'
get '/logout', to: 'sessions#destroy'

resources :data, only: [:create, :index]
resources :metrics, only: [:index]
resource :sessions, only: [:create, :destroy]