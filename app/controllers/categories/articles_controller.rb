class Categories::ArticlesController < ApplicationController
	before_filter :grab_category_from_category_id

	def index
		@articles = @category.articles
	end

	def show
		@article = @category.articles.find(article_id)
	end

	def new
		@article = @category.articles.new
	end

	def create
		@article = @category.articles.new(create_params)

		if @article.save
			redirect_to [@category, @article], notice: 'Article was successfully created.'
		else
			render :new
		end
	end

	def edit
		@article = @category.articles.find(article_id)
	end

	def update
		@article = @category.articles.find(article_id)

		if @article.update_attributes(update_params)
			redirect_to [@category, @article], notice: 'Article was successfully updated.'
		else
			render :edit
		end
	end

	def destroy
		@article = @category.articles.find(article_id)
		@article.destroy
		redirect_to category_articles_url(@category)
	end

	private

	def grab_category_from_category_id
		@category = Category.find(category_id) 
	end

	def create_params
    	params.require(:article).permit(:title, :description)
	end

	def update_params
		create_params
	end

	def article_id
		params.require(:id)
	end

	def category_id
		params.require(:category_id)
	end
end