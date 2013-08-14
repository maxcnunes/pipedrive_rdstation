Pipedrive RD Station
====================

[![Build Status](https://travis-ci.org/maxcnunes/pipedrive_rdstation.png?branch=master)](https://travis-ci.org/maxcnunes/pipedrive_rdstation)
[![Coverage Status](https://coveralls.io/repos/maxcnunes/pipedrive_rdstation/badge.png?branch=master)](https://coveralls.io/r/maxcnunes/pipedrive_rdstation?branch=master)
[![Code Climate](https://codeclimate.com/github/maxcnunes/pipedrive_rdstation.png)](https://codeclimate.com/github/maxcnunes/pipedrive_rdstation)

A simple gem for import Person data from RD Station to  Pipedrive

### Person Model Mapping

RD Station | Pipedrive        | Data Type
-----------|------------------|------------------------
name       | name             | string
last_name  | (join with name) | string
email      | email            | array
company    | org_id           | number
job_title  | job_title        | Person Field - varchar
phone      | phone            | array
website    | website          | Person Field - varchar


#### Thanks

This gem was based in the [pipedrive-ruby](https://github.com/GeneralScripting/pipedrive-ruby) gem.