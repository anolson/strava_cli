require 'sinatra/base'

module StravaCli
  module OAuth
    class CallbackService
      attr_accessor :thread

      def initialize
        @thread = Thread.new { CallbackEndpoint.run! }
      end

      def wait_for_authentication
        until AuthorizationState.authorized?
          thread.join(1)
        end
      end

      class CallbackEndpoint < Sinatra::Base
        set :logging, false
        set :server, "reel"

        get("/callback") do
          authorization_code = AuthorizationCode.new(params[:code])
          access_token = authorization_code.exchange_for_access_token

          if access_token.valid?
            AuthorizationState.authorize!
            access_token.write
          end
        end
      end
    end
  end
end
