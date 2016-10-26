get '/', to: 'data#index'

resources :data, only: [:create, :index]
resources :metrics, only: [:index]