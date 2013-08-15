module Pipedrive
  class Organization < Base
    URL_ACTIONS = { default: '/organizations' }

    def create(opts={})
      post(URL_ACTIONS[:default], { body: opts })
    end

    def id_from_response(response)
      response['data']['id'] unless response['data'].nil?
    end
  end
end