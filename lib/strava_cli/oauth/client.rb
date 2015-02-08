require 'faraday'
require 'json'

module StravaCli
  module OAuth
    class Client
      attr_reader :client_id, :client_secret

      def initialize(client_id, client_secret)
        @client_id = client_id
        @client_secret = client_secret
      end

      def access_token(code)
        response = connection.post '/oauth/token', access_token_params(code)

        JSON.parse(response.body)['access_token'] if response.success?
      end

      def access_token_params(code)
        {
          client_id: client_id,
          client_secret: client_secret,
          code: code
        }
      end

      private

      def connection
        Faraday.new(:url => 'https://www.strava.com') do |faraday|
          faraday.request  :url_encoded             # form-encode POST params
          faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
        end
      end
    end
  end
end

