class Categories::ArticlesController < ApplicationController
	before_filter :grab_category_from_category_id

	def index
		@articles = @category.articles
	end

	def new
		@article = @category.articles.new
	end

	private

	def grab_category_from_category_id
		@category = Category.find(params[:category_id]) 
	end
end