require 'base64'
require "nemid/version"
require "nemid/authentication"
require "nemid/crypto"
require "nemid/ocsp.rb"
require "nemid/xmldsig"

module NemID
  class Error < StandardError; end
end
