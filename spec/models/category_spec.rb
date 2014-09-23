require 'rails_helper'

describe Category do
	context 'validation' do
		it { is_expected.to validate_presence_of :title }
	end

	context 'association' do
		it { is_expected.to have_many :articles }
	end
end