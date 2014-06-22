class SessionsController < ApplicationController
	def new
		@user = User.new
	end

	def create
		user = User.find_by(email: params[:session][:email])
		if user && user.authenticate(params[:session][:password])
    	session[:user_id] = user.id
    	redirect_to user_articles_path(user)
    	# Sign the user in and redirect to the user's show page.
	  else
	  	flash[:error] = 'Invalid email/password combination'
	    render 'new'# Create an error message and re-render the signin form.
	  end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url
	end
end