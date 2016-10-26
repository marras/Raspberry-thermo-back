require 'hanami/model'
require 'hanami/mailer'
Dir["#{ __dir__ }/health_monitor/**/*.rb"].each { |file| require_relative file }

Hanami::Model.configure do
  ##
  # Database adapter
  #
  # Available options:
  #
  #  * Memory adapter
  #    adapter type: :memory, uri: 'memory://localhost/health_monitor_development'
  #
  #  * SQL adapter
  #    adapter type: :sql, uri: 'sqlite://db/health_monitor_development.sqlite3'
  #    adapter type: :sql, uri: 'postgres://localhost/health_monitor_development'
  #    adapter type: :sql, uri: 'mysql://localhost/health_monitor_development'
  #
  adapter type: :sql, uri: ENV['HEALTH_MONITOR_DATABASE_URL']

  ##
  # Migrations
  #
  migrations 'db/migrations'
  schema     'db/schema.sql'

  ##
  # Database mapping
  #
  # Intended for specifying application wide mappings.
  #
  # You can specify mapping file to load with:
  #
  # mapping "#{__dir__}/config/mapping"
  #
  # Alternatively, you can use a block syntax like the following:
  #
  mapping do
  end
end.load!

Hanami::Mailer.configure do
  root "#{ __dir__ }/health_monitor/mailers"

  # See http://hanamirb.org/guides/mailers/delivery
  delivery do
    development :test
    test        :test
    # production :stmp, address: ENV['SMTP_PORT'], port: 1025
  end
end.load!
