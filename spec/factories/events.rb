FactoryGirl.define do
  factory :event do
		extended_html_description 'description'    
		venue Venue.new
		category Category.new
  end
end
