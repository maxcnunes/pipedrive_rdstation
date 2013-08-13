require 'json'
require 'httparty'

module Pipedrive
  class Base
    # Globally set request headers
    HEADERS_REQUEST = {
      "User-Agent"    => "Ruby.Pipedrive.Api",
      "Accept"        => "application/json",
      "Content-Type"  => "application/x-www-form-urlencoded"
    }
    BASE_URL = "http://api.pipedrive.com/v1/"

    class << self
      def url_request(sufix_url)
        "#{BASE_URL}#{sufix_url}"
      end
      
      def authenticate(email, password)
        response = HTTParty.post(url_request("authorizations"),
                    :body => { :email => email, :password => password },
                    :headers => HEADERS_REQUEST)
        
        response['success'] ? api_token_from_response(response) : bad_request(response)
      end
      
      
      private 
      def api_token_from_response(response)
        !response['data'].nil? && response['data'].size > 0 ? response['data'].first['api_token'] : ''
      end
      
      def bad_request(response)
        raise (response['error'] || 'An error occurred while processing the request')
      end
    end
  end
end