FactoryGirl.define do
  factory :user do
    email "MyString"
	  password "MyString"
	  password_confirmation "MyString"
    name "MyString"
   	initialize_with { User.find_or_create_by(email: email) }
  end
end
