module NemID
  module Authentication
    class ResponseError < StandardError; end
  end
end

require_relative "authentication/params"
require_relative "authentication/response"
