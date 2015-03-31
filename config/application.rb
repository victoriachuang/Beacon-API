require File.expand_path('../boot', __FILE__)
require 'rails/all'
require "active_record/railtie"
Bundler.require(*Rails.groups)

module SkeletonRailsApi
  class Application < Rails::Application

    config.app_generators.scaffold_controller :responders_controller
    config.active_record.raise_in_transactional_callbacks = true

    # Added for Devise to work (https://github.com/rails-api/rails-api/issues/38)
    config.middleware.use config.session_store, config.session_options
    config.middleware.use Rack::MethodOverride
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore
    config.middleware.use ActionDispatch::Flash

    config.middleware.insert_before 0, "Rack::Cors", :debug => true, :logger => (-> { Rails.logger }) do
      allow do
        origins '*'
        resource '*',
          :headers => :any,
          :methods => [:get, :post, :delete, :put, :options, :head],
          :credentials => true,
          :expose  => ['access-token', 'expiry', 'token-type', 'uid', 'client']
      end
    end
  end
end
