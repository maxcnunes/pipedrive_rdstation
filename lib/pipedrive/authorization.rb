module Pipedrive
  class Authorization < Base
    URL_ACTIONS = { authorizatons: '/authorizations' }
    
    def initialize(email, password)      
      @email, @password = email, password
    end
    
    def authenticate()
      response = post(URL_ACTIONS[:authorizatons], { body: { email: @email, password: @password } })
      api_token_from_response(response)
    end
    
    def api_token_from_response(response)
      !response['data'].nil? && response['data'].size > 0 ? response['data'].first['api_token'] : ''
    end
    
  end
end