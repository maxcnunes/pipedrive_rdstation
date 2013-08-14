module Pipedrive
  class Person < Base
    URL_ACTIONS = { create: '/persons' }

    def create(opts={})
      post(URL_ACTIONS[:create], { body: opts })
    end

  end
end