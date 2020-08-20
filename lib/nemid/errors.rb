module NemID
  module Errors
    class ResponseError < StandardError
      attr_reader :da, :en
    end
  end
end

require_relative "errors/app"
require_relative "errors/auth"
#require_relative "errors/can"
#require_relative "errors/capp"
#require_relative "errors/lock"