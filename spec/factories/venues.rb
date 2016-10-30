require 'faker'

FactoryGirl.define do
  factory :venue do
  	name { Faker::Name.name }
  	full_address '123 abc street'
  	region
  end
end
