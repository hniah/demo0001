require 'rails_helper'

describe CategoriesController do
	describe 'GET #index' do
		let!(:categories) { create_list(:category, 2) }

		it 'populates an array of categories' do
			get :index
			expect(assigns(:categories).count).to eq 2
		end

		it 'renders the :index view' do
			get :index
			expect(response).to render_template :index
		end
	end
end