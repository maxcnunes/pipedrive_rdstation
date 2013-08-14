module Pipedrive
  class PersonField < Base
    URL_ACTIONS = { default: "/personFields" }
    
    def create(opts={})
      post(URL_ACTIONS[:default], { body: opts })
    end
    
    def all
      get(URL_ACTIONS[:default])
    end
    
    def find(id)
      get("#{URL_ACTIONS[:default]}/#{id}")
    end
    
    def id_from_response(response)
      response['data']['id'] unless response['data'].nil?
    end

    def key_from_response(response)
      response['data']['key'] unless response['data'].nil?
    end
  end
end