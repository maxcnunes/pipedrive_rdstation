require 'json'
require 'httparty'

module Pipedrive
  class Base
    include HTTParty
    base_uri "http://api.pipedrive.com/v1"
    
    HEADERS_REQUEST = {
      "User-Agent"    => "Ruby.Pipedrive.Api",
      "Accept"        => "application/json",
      "Content-Type"  => "application/x-www-form-urlencoded"
    }
    
    def self.setup_httparty
      headers HEADERS_REQUEST
    end
    
    protected
    def post(url, opts={})
      response = self.class.post(url, opts)
      process_result(response)
    end
    
    def process_result(response)
      response['success'] ? response : bad_request(response)
    end
    
    def bad_request(response)
      raise (response['error'] || 'An error occurred while processing the request')
    end
  end
end