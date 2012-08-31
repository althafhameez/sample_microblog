class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by_email(params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			#sign the user in and redirect
			sign_in user
			redirect_back_or user
		else
			flash.now[:error] = 'Invalid Email / Password combination'
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_url
	end
end
