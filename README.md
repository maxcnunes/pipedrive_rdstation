Pipedrive RD Station
====================

[![Build Status](https://travis-ci.org/maxcnunes/pipedrive_rdstation.png?branch=master)](https://travis-ci.org/maxcnunes/pipedrive_rdstation)
[![Coverage Status](https://coveralls.io/repos/maxcnunes/pipedrive_rdstation/badge.png?branch=master)](https://coveralls.io/r/maxcnunes/pipedrive_rdstation?branch=master)
[![Code Climate](https://codeclimate.com/github/maxcnunes/pipedrive_rdstation.png)](https://codeclimate.com/github/maxcnunes/pipedrive_rdstation)

A simple gem for import Person data from [RD Station (demo project)](https://github.com/maxcnunes/rdstation) to  Pipedrive

### Install

Including the gem directly from the github in your project Gemfile:

```ruby
gem 'pipedrive_rdstation', :github => 'maxcnunes/pipedrive_rdstation'
```

Then you will need bundle it to complete the installation:
```bash
bundle
```

### Usage Examples

The APP_KEY used in the examples is a token provided by [Pipedrive API](https://developers.pipedrive.com/v1). If you don't you know your APP_KEY in can get it in Pipedrive user settings page or you can also get it using this gem:
```ruby
APP_KEY = Pipedrive::Authorization.new("your_email", "your_password").authenticate
```

#### Creating a Organization

[Pipedrive API : Organization - Create](https://developers.pipedrive.com/v1#methods-Organizations)

```ruby
pd_organization = Pipedrive::Organization.new(APP_KEY)

organization = pd_organization.create({
  name: "My Organization",
  owner_id: "",
  visible_to: "",
  add_time: ""
})

# org_id
id = pd_organization.id_from_response(organization)
```

#### Creating a Person Custom Fields

[Pipedrive API : Person Custom Fields - Create](https://developers.pipedrive.com/v1#methods-PersonFields)

```ruby
pd_person_field = Pipedrive::PersonField.new(APP_KEY)

field_response = pd_person_field.create({ name: "My New Custom Field", field_type: "varchar" })

# responds just with the custom field ID
field_id = pd_person_field.id_from_response(field_response)

# as we need the custom field KEY to associate this field with a Person
# we request this field full data
field = pd_person_field.find(field_id)

# custom field KEY
key = custom_field.key_from_response(field)
```
Take a look in the Pipedrive API documentation to choose the best field_type for your case.

#### Creating a Person

[Pipedrive API : Person - Create](https://developers.pipedrive.com/v1#methods-Persons)

```ruby
pd_person = Pipedrive::Person.new(APP_KEY)

new_person = pd_person.create({
  name: "Felix Silva",
  owner_id: "",
  org_id: "",
  email: ["felix@silva.com"],
  phone: ["44887755"],
  visible_to: "",
  add_time: ""
}) 
```

You also can create a person with custom fields. 
```ruby
pd_person = Pipedrive::Person.new(APP_KEY)

new_person = pd_person.create({
  name: "Felix Silva",
  owner_id: "",
  org_id: "",
  email: ["felix@silva.com"],
  phone: ["44887755"],
  visible_to: "",
  add_time: "",
  MY_CUSTOM_FIELD_KEY: "This is my custom field value :)"
}) 
```

##### Thanks

This gem was based in [pipedrive-ruby](https://github.com/GeneralScripting/pipedrive-ruby) gem.