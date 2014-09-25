FactoryGirl.define do
	factory :article do |f|
		f.title 	  { Faker::Lorem.sentence }
		f.description { Faker::Lorem.sentence }
		association :category
	end

	factory :invalid_article, parent: :article do |f|
		f.title		   nil
	end
end