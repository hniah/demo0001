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

	describe 'GET #show' do
		def do_request
			get :show, { category_id: article.category.id, id: article.id }
		end

		let!(:article) { create(:article) }

		it 'assigns the requested article to @article' do
			do_request
			expect(assigns(:article)).to eq article
		end

		it 'renders the :show view' do
			do_request
			expect(response).to render_template :show
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

	describe 'POST #create' do
		let!(:category) { create(:category) }

		context 'with valid attributes' do
			def do_request
				post :create, { category_id: category.id, article: attributes_for(:article) }
			end

			it 'creates a new article' do
				expect{do_request}.to change(Article, :count).by(1)
			end

			it 'redirects to the new article' do
				do_request
				expect(response).to redirect_to [category, Article.last]
			end
		end

		context 'with invalid attributes' do
			def do_request
				post :create, { category_id: category.id, article: attributes_for(:invalid_article) }
			end

			it 'does not save the new article' do
				expect{do_request}.to_not change(Article, :count)
			end

			it 're-renders to the :new view' do
				do_request
				expect(response).to render_template :new
			end
		end
	end

	describe 'GET #edit' do
		def do_request
			get :edit, { category_id: article.category.id, id: article.id }
		end

		let!(:article) { create(:article) }

		it 'renders the :edit view' do
			do_request
			expect(response).to render_template :edit
		end
	end

	describe 'PUT #update' do
		def do_request
			put :update, { category_id: article.category.id, id: article.id, article: update_params }
		end

		let!(:article)  { create(:article) }

		context 'with valid attributes' do
			let(:new_title) 	{ 'New title' }
			let(:update_params) { attributes_for(:article, title: new_title) }

			it "changes @article's attributes" do
				do_request
				article.reload
				expect(article.title).to eq new_title
			end

			it 'redirects to the updated contact' do
				do_request
				expect(response).to redirect_to [article.category, article]
			end
		end

		context 'with invalid attributes' do
			let(:update_params) { attributes_for(:invalid_article) }

			it "does not change @article's attributes" do
				do_request
				expect(assigns(:article)).to eq article
			end

			it 're-renders to the :edit view' do
				do_request
				expect(response).to render_template :edit
			end
		end
	end

	describe 'DELETE #destroy' do
		def do_request
			delete :destroy, { category_id: article.category.id, id: article.id }
		end

		let!(:article) { create(:article) }

		it 'deletes the article' do
			expect{do_request}.to change(Article, :count).by(-1)
		end

		it 'redirects to articles listing' do
			do_request
			expect(response).to redirect_to category_articles_url(article.category)
		end
	end
end