require 'httparty'

module Pipedrive
  class Base
    # Globally set request headers
    HEADERS = {
      "User-Agent"    => "Ruby.Pipedrive.Api",
      "Accept"        => "application/json",
      "Content-Type"  => "application/x-www-form-urlencoded"
    }

    class << self
      def authenticate(email, password)
        response = HTTParty.post("http://api.pipedrive.com/v1/authorizations",
                    :body => { :email => email, :password => password },
                    :headers => HEADERS)

        if response.success?
          !response['data'].nil? && response['data'].size > 0 ? response['data'].first['api_token'] : ''
        else
          # error
        end
      end
    end
  end
end