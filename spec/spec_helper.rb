require 'coveralls'
Coveralls.wear!

require 'rubygems'
require 'bundler/setup'
require 'webmock/rspec'

# our gem
require 'pipedrive_rdstation'

RSpec.configure do |config|

end

def load_fixture(file_name)
  File.read(File.join(File.dirname(__FILE__), "fixtures", file_name))
end

# common test values
HEADERS_RESPONSE = {
  "server" => "nginx/1.2.4",
  "date" => "Fri, 01 Mar 2013 13:34:23 GMT",
  "content-type" => "application/json",
  "content-length" => "1164",
  "connection" => "keep-alive",
  "access-control-allow-origin" => "*"
  }

def url_request(action_url, api_key=nil)
  url = "http://api.pipedrive.com/v1#{action_url}"
  url = "#{url}?api_token=#{api_key}" unless api_key.nil? 
  url
end