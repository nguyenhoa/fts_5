require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(:default, Rails.env)

module Fts5
  class Application < Rails::Application
    I18n.enforce_available_locales = true
    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)
  end
end
