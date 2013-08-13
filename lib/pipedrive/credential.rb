module Pipedrive
  class Credential
    attr_accessor :email, :password, :api_key

    def initialize(attrs = {})
      @email = attrs[:email]
      @password = attrs[:password]
      @api_key = attrs[:api_key]
    end
  end
end