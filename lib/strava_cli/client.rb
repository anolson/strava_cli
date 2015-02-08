require 'faraday'
require 'json'

module StravaCli
  class Client
    attr_reader :access_token

    def initialize(access_token)
      @access_token = access_token
    end

    def whoami
      response = get('/api/v3/athlete')

      JSON.parse(response.body) if response.success?
    end

    private

    def get(endpoint)
      connection.get(endpoint) do |request|
        request.headers['Authorization'] = "Bearer #{access_token}"
      end
    end

    def connection
      Faraday.new(:url => 'https://www.strava.com') do |faraday|
        faraday.request  :url_encoded             # form-encode POST params
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end
    end
  end
end

