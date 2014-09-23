require 'rails_helper'

describe Article do
	context 'validation' do
		it { is_expected.to validate_presence_of :title }
		it { is_expected.to validate_presence_of :description }
	end
end 