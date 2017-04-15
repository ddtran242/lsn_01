require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you"ve limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SocsialLearing
  class Application < Rails::Application
    config.autoload_paths += %w(#{config.root}/app/models/ckeditor)
    config.i18n.default_locale = :en
  end
end
