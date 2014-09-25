class Categories::ArticlesController < ApplicationController
	before_filter :grab_category_from_category_id

	def index
		@articles = @category.articles
	end

	def new
		@article = @category.articles.new
	end

	def create
		@article = @category.articles.new(create_params)

		if @article.save
			redirect_to root_url, notice: 'Article was successfully created.'
		else
			render :new
		end
	end

	private

	def grab_category_from_category_id
		@category = Category.find(params[:category_id]) 
	end

	def create_params
    	params.require(:article).permit(:title, :description)
	end
end