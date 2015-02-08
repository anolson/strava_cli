require "thor"

module StravaCli
  class CLI < Thor

    desc "login", "Login into Strava"
    def login
      OAuth::Webflow.run
    end

    desc "whoami", "Display info about the current athlete"
    def whoami
      athlete = client.whoami
      puts "#{athlete['firstname']} #{athlete['lastname']} (#{athlete['email']})"
    end

    private

    def client
      @client ||= Client.new(access_token)
    end

    def access_token
      @credentials ||= OAuth::AccessToken.read
    end
  end
end
