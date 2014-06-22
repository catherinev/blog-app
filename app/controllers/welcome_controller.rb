class WelcomeController < ApplicationController

	def index
		if session[:user_id]
			redirect_to user_articles_path(current_user)
		else
			render 'sessions/new'
		end
	end
end