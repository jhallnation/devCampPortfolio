require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
require "dotenv-rails"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DevCampPortfolio
  class Application < Rails::Application
    config.autoload_paths << "#{Rails.root}/lib"
    config.eager_load_paths << "#{Rails.root}/lib"
    config.secret_key_base = ENV["SECRET_KEY_BASE"]

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'localhost:8000'
        resource '/api/portfolio', headers: :any, methods: [:get, :options]
        resource '/api/login', headers: :any, methods: [:post, :options], :if => proc { |env| env['HTTP_REFERER'] == 'http://localhost:8000/auth' }
        resource '/api/logged_in', headers: :any, methods: [:get, :options]
        resource '/api/logout', headers: :any, methods: [:delete, :options]
      end
    end

  end
end