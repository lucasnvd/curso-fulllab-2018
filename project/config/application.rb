require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Project
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.autoload_paths += Dir[
      Rails.root.join('app', 'services', '{**}', '*.rb'),
      Rails.root.join('app', 'decorators', '*.rb')
    ]
  end
end
