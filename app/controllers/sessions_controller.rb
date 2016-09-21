class SessionsController < ApplicationController

	def index
		@events = Event.all
	end

	def new
	end

	def create
		@user = User.find_by(email: params[:session][:email].downcase)
		if @user && @user.authenticate(params[:session][:password])
			log_in @user
			flash[:success] = 'Successfully logged in!'
			redirect_back_or @user
		else
			flash.now[:danger] = 'Invalid email/password combination'
			render 'new'
		end
	end

	def destroy
		log_out if logged_in?
		flash[:info] = 'Successfully logged out!'
		redirect_to root_url
	end

end