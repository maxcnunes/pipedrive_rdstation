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