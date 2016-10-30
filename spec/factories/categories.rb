FactoryGirl.define do
  factory :category do
  	name 'Entertainment'
  	initialize_with { Category.find_or_create_by(name: name) }
  end
end
