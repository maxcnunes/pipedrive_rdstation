Pipedrive RD Station
====================

[![Build Status](https://travis-ci.org/maxcnunes/pipedrive_rdstation.png?branch=master)](https://travis-ci.org/maxcnunes/pipedrive_rdstation)
[![Coverage Status](https://coveralls.io/repos/maxcnunes/pipedrive_rdstation/badge.png?branch=master)](https://coveralls.io/r/maxcnunes/pipedrive_rdstation?branch=master)
[![Code Climate](https://codeclimate.com/github/maxcnunes/pipedrive_rdstation.png)](https://codeclimate.com/github/maxcnunes/pipedrive_rdstation)

A simple gem for import Person data from RD Station to  Pipedrive

### Person Model Mapping

RD Station | Data Type | Pipedrive        | Data Type
-----------|-----------|------------------|------------------------
name       | string    | name             | string
last_name  | string    | (join with name) |
email      | string    | email            | array
company    | string    | org_id           | number
job_title  | string    | job_title        | Person Field - varchar
phone      | string    | phone            | array
website    | string    | website          | Person Field - varchar

***ps:*** Probably you will need store the org_id, to identify it between RD Station and Pipedrive

##### Thanks

This gem was based in [pipedrive-ruby](https://github.com/GeneralScripting/pipedrive-ruby) gem.