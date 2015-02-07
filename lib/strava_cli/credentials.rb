require "netrc"

module StravaCli
  class Credentials
    attr_reader :code, :access_token

    def self.read
      new.tap do |object|
        object.read
      end
    end

    def initialize(code = nil)
      @code = code
      @access_token = nil
    end

    def exchange!
      authenticate! client.access_token(code)
    end

    def write
      netrc["strava.com"] = ["_", access_token]
      netrc.save
    end

    def read
      authenticate! netrc["strava.com"].password
    end

    private

    attr_writer :access_token

    def authenticate!(access_token)
      return if access_token.nil?

      self.access_token = access_token
      AuthenticationState.authenticate!
    end

    def netrc
      @netrc ||= Netrc.read
    end

    def client
      @client ||= OAuth::Client.new(ENV["client_id"], ENV["client_secret"])
    end
  end
end
