require 'spec_helper'

describe Pipedrive::PersonField do
  before(:each) do
    @app_key = "secrete_token_api_9809897898787899797979" 
    @person_field = Pipedrive::PersonField.new(@app_key)
  end
  
  describe "#create" do
    def do_create_request(attributes, body_response, success=true)
      stub_request(:post, url_request(Pipedrive::PersonField::URL_ACTIONS[:default], @app_key)).
        with(body: attributes, headers: Pipedrive::Base::HEADERS_REQUEST).
        to_return(status: success ? 200 : 400, body: body_response, headers: HEADERS_RESPONSE)
    end

    it "responds with the person field id created for the new field" do
      valid_person_field_id = 9029
      person_field_to_create = {
        name: "my_new_field",
        field_type: "varchar",
        options: ""
      }
      
      do_create_request(person_field_to_create, load_fixture("create_person_field.json"))
      
      person_field_id = @person_field.create(person_field_to_create)
      
      # asserts
      person_field_id.should eql(valid_person_field_id)
    end
  end
  
  describe "#all" do
    def do_all_request(body_response)
      stub_request(:get, url_request(Pipedrive::PersonField::URL_ACTIONS[:default], @app_key)).
        with(headers: Pipedrive::Base::HEADERS_REQUEST).
        to_return(status: 200, body: body_response, headers: HEADERS_RESPONSE)
    end

    it "responds with the person field id created for the new field" do
      do_all_request(load_fixture("all_person_fields.json"))
      
      person_fields = @person_field.all()
      
      # asserts
      person_fields.should_not be_nil
    end
  end
end