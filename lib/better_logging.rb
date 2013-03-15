require 'active_support'
require 'better_logging/better_logging'

module BetterLogging
  class Railtie < ::Rails::Railtie
    begin
      rails_logger = Object.const_get('ActiveSupport::Logger')
    rescue NameError
      rails_logger = Object.const_get('ActiveSupport::BufferedLogger')
    end

    rails_logger.send(:include, ::PaulDowman::RailsPlugins::BetterLogging)
  end
end
