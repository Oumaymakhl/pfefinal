require_relative "boot"
require "rails/all"

Bundler.require(*Rails.groups)

module Pfe
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w(assets tasks))

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end

# Configuration de l'envoi d'e-mails via SMTP
Pfe::Application.configure do
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address: 'smtp.gmail.com', # Adresse SMTP de Gmail
    port: 587, # Port SMTP de Gmail
    domain: 'gmail.com', # Domaine utilisé dans l'envoi des e-mails via Gmail
    user_name: 'oumaymakahouli20@gmail.com', # Votre adresse e-mail Gmail
    password: 'thgh ffsc ptkw aobt', # Votre mot de passe Gmail
    authentication: :plain, # Méthode d'authentification
    enable_starttls_auto: true # Activation de STARTTLS pour le chiffrement
  }
end
