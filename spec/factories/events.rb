require 'faker'

FactoryGirl.define do
  factory :event do
  	name { Faker::Name.name }
		extended_html_description 'description'    
		venue
		category
		is_published true
		user
  end
end
