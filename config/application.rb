require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ToDoApp
  class Application < Rails::Application
    config.active_record.default_timezone = :local

    #　以下の記述を追記する(設定必須)
    # デフォルトのlocaleを日本語(:ja)にする
    config.i18n.default_locale = :ja
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    config.time_zone = 'Asia/Tokyo'
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.action_controller.allow_forgery_protection = false
    config.to_prepare do
      DeviseController.respond_to :html, :json
    end
  end
end
