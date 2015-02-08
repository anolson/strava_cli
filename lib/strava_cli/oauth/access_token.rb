require "netrc"

module StravaCli
  module OAuth
    class AccessToken
      attr_reader :value

      def self.read
        new.tap do |object|
          object.read
        end
      end

      def initialize(value = nil)
        @value = value
      end

      def valid?
        !value.nil?
      end

      def to_s
        value
      end

      def write
        netrc["strava.com"] = ["_", value]
        netrc.save
      end

      def read
        self.value = netrc["strava.com"].password
      end

      private

      attr_writer :value

      def netrc
        @netrc ||= Netrc.read
      end
    end
  end
end
