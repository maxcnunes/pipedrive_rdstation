require 'spec_helper'

describe Pipedrive::Organization do
  before(:each) do
    @app_key = "secrete_token_api_9809897898787899797979"
    @valid_organization_field_id = 3
    @organization = Pipedrive::Organization.new(@app_key)
  end
  
  describe "#create" do
    def do_create_request(attributes, body_response)
      stub_request(:post, url_request(Pipedrive::Organization::URL_ACTIONS[:default], @app_key)).
        with(body: attributes, headers: Pipedrive::Base::HEADERS_REQUEST).
        to_return(status: 200, body: body_response, headers: HEADERS_RESPONSE)
    end

    it "responds with the organization data created" do
      orgaznization_to_create = {
        name: "My Organization",
        owner_id: "",
        visible_to: "",
        add_time: ""
      }
      
      do_create_request(orgaznization_to_create, load_fixture("create_organization.json"))
      
      organization = @organization.create(orgaznization_to_create)
      id = @organization.id_from_response(organization)
      
      # asserts
      id.should eql(@valid_organization_field_id)
    end
  end
end