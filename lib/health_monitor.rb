require 'hanami/model'
require 'hanami/mailer'
Dir["#{ __dir__ }/health_monitor/**/*.rb"].each { |file| require_relative file }

Hanami::Model.configure do
  adapter type: :sql, uri: ENV['DATABASE_URL']

  migrations 'db/migrations'
  schema     'db/schema.sql'

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
