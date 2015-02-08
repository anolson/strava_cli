module StravaCli
  module OAuth
    class AuthorizationState
      class << self
        attr_accessor :state

        def authorized?
          state == :authorized
        end

        def authorize!
          self.state = :authorized
        end
      end
    end
  end
end
