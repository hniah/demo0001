require 'rails_helper'

describe CategoriesController do
	describe '#index' do
		def do_request
			get :index
		end

		let!(:categories) { create_list(:category, 2) }

		it 'List out a list of categories' do
			do_request
			expect(assigns(:categories).count).to eq 2
		end
	end
end