FactoryGirl.define do
  factory :region do
  	name 'Ho Chi Minh'
  	initialize_with { Region.find_or_create_by(name: name)}
  end
end