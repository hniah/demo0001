require 'rails_helper'

describe Categories::ArticlesController do
	describe 'GET #index' do
		def do_request
			get :index, category_id: category.id
		end

		let!(:category) { create(:category) }
		let!(:articles) { create_list(:article, 2, category: category) }

		it 'populates an array of articles in the category' do
			do_request
			expect(assigns(:articles).size).to eq 2
		end

		it 'renders the :index view' do
			do_request
			expect(response).to render_template :index
		end
	end

	describe 'GET #new' do
		def do_request
			get :new, category_id: category.id
		end

		let!(:category) { create(:category) }

		it 'renders the :new view' do
			do_request
			expect(response).to render_template :new
		end
	end
end