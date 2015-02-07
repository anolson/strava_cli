module StravaCli
  class AuthenticationState
    class << self
      attr_accessor :state

      def authenticated?
        state == :authenticated
      end

      def authenticate!
        self.state = :authenticated
      end
    end
  end
end
