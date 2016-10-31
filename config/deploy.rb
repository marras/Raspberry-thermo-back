lock '3.5.0'

set :application, 'thermo_monitor'

set :scm, :git
set :repo_url, 'git@github.com:marras/Raspberry-thermo-back.git'

set :deploy_to, '/home/deploy/thermo_monitor'

set :keep_releases, 5
set :log_level, :debug

set :linked_files, %w{.env}
set :linked_dirs, %w{log}

set :rvm_type, :system

namespace :deploy do
  desc "Precompile Hanami assets"
  task :precompile do
    on roles(:all) do
      execute "cd #{fetch(:deploy_to)}/current && HANAMI_ENV=production #{fetch(:rvm_custom_path)} default do bundle exec hanami assets precompile"
    end
  end

  desc "Restart Puma server"
  task :restart_server do
    on roles(:all) do
      execute "sudo service puma-manager restart"
    end
  end

  after :published, :precompile
  after :precompile, :restart_server
end
