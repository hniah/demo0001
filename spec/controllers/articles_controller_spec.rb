require 'rails_helper'

describe ArticlesController do
	describe 'GET #index' do
		def do_request 
			get :index
		end

		let!(:articles) { create_list(:article, 2) }

		it 'populated an array of articles' do
			do_request
			expect(assigns(:articles).size).to eq 2
		end

		it 'renders the :index view' do
			do_request
			expect(response).to render_template :index
		end
	end
end