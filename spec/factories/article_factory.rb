FactoryGirl.define do
	factory :article do
		sequence(:title) { |n| "Article #{n}" }
		description "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
	end
end