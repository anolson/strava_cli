module StravaCli
  module OAuth
    class AuthorizationCode
      attr_reader :value

      def initialize(value)
        @value = value
      end

      def to_s
        value
      end

      def exchange_for_access_token
        AccessToken.new client.access_token(value)
      end

      def client
        @client ||= OAuth::Client.new(ENV["client_id"], ENV["client_secret"])
      end
    end
  end
end
