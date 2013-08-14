module Pipedrive
  class PersonField < Base
    URL_ACTIONS = { default: "/personFields" }
    
    def create(opts={})
      response = post(URL_ACTIONS[:default], { body: opts })
      person_field_id_from_response(response)
    end
    
    def all
      get(URL_ACTIONS[:default])
    end
    
    def person_field_id_from_response(response)
      response['data']['id'] unless response['data'].nil?
    end
  end
end