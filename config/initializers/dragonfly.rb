require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "a75fd38fc530f10cf2f7449c20fe6de9e700020c67aeb41518757a1c5f32ee43"

  url_format "/media/:job/:name"

  datastore :file,
    root_path: Rails.root.join('public/system/dragonfly', Rails.env),
    server_root: Rails.root.join('public')
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
ActiveSupport.on_load(:active_record) do
  extend Dragonfly::Model
  extend Dragonfly::Model::Validations
end
