require 'base64'
require "nemid/version"
require "nemid/authentication"
require "nemid/crypto"
require "nemid/errors"
require "nemid/ocsp"
require "nemid/xmldsig"
require 'nemid/pid_cpr'

module NemID
  class Error < StandardError; end
end
