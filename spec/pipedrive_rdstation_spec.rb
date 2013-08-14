require 'spec_helper'

describe Pipedrive do
  context ".setup_httparty" do
    it "configures default headers for Pipedrive API standards" do
      Pipedrive::Base.headers.should_not be_nil
    end
    
    it "User-Agent is 'Ruby.Pipedrive.Api'" do
      Pipedrive::Base.headers['User-Agent'].should eql("Ruby.Pipedrive.Api")
    end
    
    it "Accept is 'Ruby.Pipedrive.Api'" do
      Pipedrive::Base.headers['Accept'].should eql("application/json")
    end
    
    it "Content-Type is 'Ruby.Pipedrive.Api'" do
      Pipedrive::Base.headers['Content-Type'].should eql("application/x-www-form-urlencoded")
    end

  end
end