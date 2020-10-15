module NemID
  class Configuration
    attr_accessor :env, :oces_certificate, :private_key, :spid

    def initialize
      @env = default_for_env
      @oces_cert = nil
      @private_key = nil
      @spid = nil
    end

    def default_for_env
      return Rails.env.to_s if defined?(Rails.env)
      ENV['RAILS_ENV'] || ENV['RACK_ENV'] || 'development'
    end
  end
end