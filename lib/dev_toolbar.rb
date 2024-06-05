# frozen_string_literal: true

require_relative "dev_toolbar/version"
require_relative "dev_toolbar/railtie"
require_relative "dev_toolbar/toolbar_helper"
require_relative "dev_toolbar/configuration"

module DevToolbar
  class Error < StandardError; end
  
  class << self
    attr_accessor :configuration

    def configure
      self.configuration ||= Configuration.new
      yield(configuration)
    end
  end
end
