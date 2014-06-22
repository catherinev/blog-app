class TagsController < ApplicationController
	def show
		@tag_id = params[:id]
		@user = User.find(params[:user_id])
		@found_articles = Tag.articles_with_user_and_tag(@user.id, @tag_id)
	end
end
