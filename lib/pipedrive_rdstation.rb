require 'pipedrive/base'

module Pipedrive
  def self.authenticate(email, password)
    Base.authenticate(email, password)
  end
end