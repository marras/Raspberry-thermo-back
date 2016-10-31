require 'pg'
require 'sequel'

DB = Sequel.connect(ENV['DATABASE_URL'] || "postgres://localhost/thermo_#{ENV['RACK_ENV']}")
