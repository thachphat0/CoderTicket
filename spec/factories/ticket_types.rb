require 'faker'

FactoryGirl.define do
  factory :ticket_type do
  	name { Faker::Name.name }
  	price 1000
  	max_quantity 100
  end
end
