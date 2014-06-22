class ArticlesController < ApplicationController

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)

		if @article.save
			@article.save_tags(params[:article][:tags_to_s])
			current_user.articles << @article
			redirect_to user_articles_path
		else
			render 'new'
		end
	end

	def show
		@user = User.find(params[:user_id])
	  @article = Article.find(params[:id])
	end

	def index
		@user = User.find(params[:user_id])
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])

		if @article.update(article_params)
			@article.save_tags(params[:article][:tags_to_s])
			redirect_to user_articles_path
		else
			render 'edit'
		end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		redirect_to user_articles_path
	end



	private
  def article_params
    params.require(:article).permit(:title, :text)
  end

end