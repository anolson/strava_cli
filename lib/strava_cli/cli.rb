require "thor"

module StravaCli
  class CLI < Thor

    desc "login", "Login into Strava"
    def login
      StravaCli::OAuth::Webflow.run
    end

    desc "whoami", "Display info about the current athlete"
    def whoami
      athlete = client.whoami
      puts "#{athlete['firstname']} #{athlete['lastname']} (#{athlete['email']})"
    end

    private

    def client
      @client ||= Client.from_credentials(credentials)
    end

    def credentials
      @credentials ||= Credentials.read
    end
  end
end
