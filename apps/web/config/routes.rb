get '/', to: 'data#index'
get '/data', to: 'data#show'

resources :data, only: [:create]
resources :metrics, only: [:index]