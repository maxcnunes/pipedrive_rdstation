require 'spec_helper'

describe Pipedrive::Person do
  describe "#create" do
    before(:each) { @app_key = "secrete_token_api_9809897898787899797979" }

    
    def do_create_request(attributes, body_response, success=true)
      stub_request(:post, url_request(Pipedrive::Person::URL_ACTIONS[:create], @app_key)).
        with(body: attributes, headers: Pipedrive::Base::HEADERS_REQUEST).
        to_return(status: success ? 200 : 400, body: body_response, headers: HEADERS_RESPONSE)
    end

    it "responds with user data created" do
      
      person_to_create = {
        name: "Felix Silva",
        owner_id: "",
        org_id: "",
        email: ["felix@silva.com"],
        phone: ["44887755"],
        visible_to: "",
        add_time: ""
      }

      do_create_request(person_to_create, load_fixture("create_person.json"))
      
      # asserts
      person = Pipedrive::Person.new(@app_key)
      new_person = person.create(person_to_create)
      new_person.should_not be_nil
    end 

  end
end