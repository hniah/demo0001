require 'rails_helper'

describe 'Articles' do
	describe 'Manage articles' do
		let!(:category) { create(:category) }

		it 'creates a new article and displays the results' do
			article = FactoryGirl.build(:article)

			visit category_articles_url(category)

			expect {
				click_link 'Create'
				fill_in 'Title', 		with: article.title
				fill_in 'Description',  with: article.description
				click_button 'Create Article'
			}.to change(Article, :count).by(1)

			expect(page).to have_content 'Article was successfully created.'

			within 'h1' do
				expect(page).to have_content article.title
			end

			expect(page).to have_content category.title
		end

		it 'deletes an article' do
			article = FactoryGirl.create(:article, category: category)

			visit category_article_path(category, article)

			expect {
				within '#categories-articles-show-container' do
					click_link 'Delete'
				end
			}.to change(Article, :count).by(-1)
			expect(page).to have_content "Articles for #{category.title}"
		end
	end
end