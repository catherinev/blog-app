class ArticlesController < ApplicationController

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)


		if @article.save
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
		@articles = Article.where("user_id = ?", params[:user_id]).order('created_at DESC')
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])

		if @article.update(article_params)
			redirect_to @article
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