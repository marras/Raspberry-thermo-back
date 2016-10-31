set :stage, :production
set :branch, 'master'
set :full_app_name, "#{fetch(:application)}_#{fetch(:stage)}"

server '150.254.80.131', user: 'deploy', roles: %w{app db web}, port: 22
