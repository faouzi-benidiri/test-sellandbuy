require_relative "boot"

require "rails/all"
require 'dotenv/rails-now'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module GitFlow
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
# config/application.rb
# config de  Pay associé à Stripe
  config.action_mailer.default_url_options = { host: "http://localhost:3000" }
    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    
    config.before_configuration do
      Dotenv.load('.env')

      config.active_record.async_query_executor = :global_thread_pool
    end
  end
end
