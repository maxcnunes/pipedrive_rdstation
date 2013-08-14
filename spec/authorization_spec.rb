require 'spec_helper'

describe Pipedrive::Authorization do
 
  describe "#authenticate" do
    def url_request(action_url)
      "http://api.pipedrive.com/v1#{action_url}"
    end
    
    def do_authorization_request(email, password, body_response, success=true)
      stub_request(:post, url_request('/authorizations')).
        with(body: { email: email, password: password }, headers: Pipedrive::Base::HEADERS_REQUEST).
        to_return(status: success ? 200 : 400, body: body_response, headers: HEADERS_RESPONSE)
    end

    context "when is a valid user" do
      it "gives back the user's api key" do
        email, password, valid_app_key = "test@test.com", "secret", "secrete_token_api_9809897898787899797979"
        do_authorization_request(email, password, load_fixture("valid_authorizations.json"))
        
        # asserts
        app_key = Pipedrive::Authorization.new(email, password).authenticate
        app_key.should eql(valid_app_key)
      end
    end
    
    context "when is not a valid user" do
      it "raise an execption with the error description" do
        email, password = "not_valid_test@test.com", "not_valid_secret"
        do_authorization_request(email, password, load_fixture("not_valid_authorizations.json"), false)
        
        # asserts
        lambda { Pipedrive::Authorization.new(email, password).authenticate }.should raise_error
      end
    end

  end
end