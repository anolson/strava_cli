require 'launchy'

module StravaCli
  module OAuth
    class Webflow
      include StravaCli::Output

      attr_reader :oauth_callback_service

      def self.run
        new.run
      end

      def initialize
        @oauth_callback_service = CallbackService.new
      end

      def run
        display_countdown
        launch_browser
        oauth_callback_service.wait_for_authentication
      end

      def display_countdown
        3.downto(1) do |i|
          sleep(1)
          overwrite_output "Launching browser in #{i} seconds..."
        end
      end

      def launch_browser
        Launchy.open authorize_url
      end

      def authorize_url
        "https://www.strava.com/oauth/authorize?client_id=3007&response_type=code&redirect_uri=http://localhost:4567/callback&scope=write"
      end
    end
  end
end
