require 'pg'
require 'sequel'

DB = Sequel.connect(ENV['DATABASE_URL'] || "postgres://localhost/health_monitor_#{ENV['RACK_ENV']}")
