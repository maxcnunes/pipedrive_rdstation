module Pipedrive
  class Person < Base
    URL_ACTIONS = { default: '/persons' }

    def create(opts={})
      post(URL_ACTIONS[:default], { body: opts })
    end

  end
end