require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BlogTest
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.assets.paths << Rails.root.join('vendor/node_modules')

    config.autoload_paths << "#{Rails.root}/lib"
    config.i18n.default_locale = :de

    config.custom_config_variable = {
      weather_warnings: 'http://some-wetter-website'
    }
    # config callbacks:
    # config.before_initialize
    config.after_initialize do
      ActiveRecord::Migrator.migrate(Rails.root.join("db","migrate"))
    end

  end
end
