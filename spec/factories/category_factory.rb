FactoryGirl.define  do
	factory :category do |f|
		f.title { Faker::Lorem.sentence }
	end
end