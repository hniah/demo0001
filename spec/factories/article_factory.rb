FactoryGirl.define do
	factory :article do |f|
		f.title 	  { Faker::Lorem.sentence }
		f.description { Faker::Lorem.sentence }
		association :category
	end
end