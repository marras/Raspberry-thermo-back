# Change to match your CPU core count
workers 2

# Min and Max threads per worker
threads 1, 6

app_dir = "/home/deploy/thermo_monitor"
shared_dir = "#{app_dir}/shared"

# Default to production
rack_env = ENV['RACK_ENV'] || "production"
environment rack_env

# Set up socket location
bind "unix://#{shared_dir}/sockets/puma.sock"

# Logging
stdout_redirect "#{shared_dir}/log/puma.stdout.log", "#{shared_dir}/log/puma.stderr.log", true

# Set master PID and state locations
pidfile "#{shared_dir}/pids/puma.pid"
state_path "#{shared_dir}/pids/puma.state"
activate_control_app

on_worker_boot do
  #require "sequel"
  #ActiveRecord::Base.connection.disconnect! rescue ActiveRecord::ConnectionNotEstablished
  #ActiveRecord::Base.establish_connection(YAML.load_file("#{app_dir}/config/database.yml")[rack_env])
end