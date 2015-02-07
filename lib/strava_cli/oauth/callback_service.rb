require 'sinatra/base'

module StravaCli
  module OAuth
    class CallbackService
      attr_accessor :thread

      def initialize
        @thread = Thread.new { CallbackEndpoint.run! }
      end

      def wait_for_authentication
        until AuthenticationState.authenticated?
          thread.join(1)
        end
      end

      class CallbackEndpoint < Sinatra::Base
        set :logging, false
        set :server, "reel"

        get("/callback") do
          credentials = Credentials.new(params[:code])
          credentials.exchange!
          credentials.write
        end
      end
    end
  end
end
