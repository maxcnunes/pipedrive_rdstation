require 'spec_helper'

describe Pipedrive::Credential do

  it "should build Credential by params" do
    credential = Pipedrive::Credential.new(email: 'test@test.com', password: '****', api_key: 'K09_adsf&#@a09.5+87&')
    credential.should_not be_nil
  end

end