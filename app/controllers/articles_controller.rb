class ArticlesController < ApplicationController
	before_filter :grab_category_from_category_id

	def index
		@articles = articles.all
	end

	private

	def articles
		@category ? @category.articles : Category
	end

	def grab_category_from_category_id
		@category = Category.find(params[:category_id]) if params[:category_id]
	end
end