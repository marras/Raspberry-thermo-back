require 'rubygems'
require 'bundler/setup'
require 'hanami/setup'
require_relative '../lib/thermo_monitor'
require_relative '../apps/web/application'

Dir['config/initializers/*.rb'].each { |f| require_relative "../#{f}" }

Hanami::Container.configure do
  mount Web::Application, at: '/'
end
