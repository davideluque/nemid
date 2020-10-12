require 'base64'
require "nemid/version"
require "nemid/authentication"
require "nemid/configuration"
require "nemid/crypto"
require "nemid/errors"
require "nemid/ocsp"
require "nemid/xmldsig"
require 'nemid/pid_cpr'

module NemID
  class << self
    attr_accessor :configuration
  end
  
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  class Error < StandardError; end
end
