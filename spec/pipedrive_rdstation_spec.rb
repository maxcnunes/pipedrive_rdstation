require 'spec_helper'

describe Pipedrive do
  describe ".authenticate" do
    # it "authenticates valid user by email and password" do
    #   app_key = Pipedrive.authenticate('test@test.com', '****')
    #   app_key.should_not be_nil
    # end

    it "gives back this user's api key" do
      email, password = "test@test.com", "secret"
      body = load_fixture("valid_authorizations.json")

      stub_request(:post, "http://api.pipedrive.com/v1/authorizations").
         with(:body => {"email"=> email, "password"=> password},
              :headers => {'Accept'=>'application/json',
                'Content-Type'=>'application/x-www-form-urlencoded', 'User-Agent'=>'Ruby.Pipedrive.Api'}).
         to_return(:status => 200, :body => body, :headers => {
          "server" => "nginx/1.2.4",
          "date" => "Fri, 01 Mar 2013 13:34:23 GMT",
          "content-type" => "application/json",
          "content-length" => "1164",
          "connection" => "keep-alive",
          "access-control-allow-origin" => "*"
        })



      app_key = Pipedrive.authenticate(email, password)
      app_key.should_not be_nil
      app_key.should_not be_empty
    end


  end
end