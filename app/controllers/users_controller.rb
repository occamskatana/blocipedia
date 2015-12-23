class UsersController < ApplicationController



	def show
	@user = current_user
	end

	def update
		@user = current_user
		@user.guest!

		if @user.save
			flash[:notice] = "Your account has been downgraded. Please note that there are no refunds"
			redirect_to user_path
		else
			flash[:error] = "Your account could not be downgraded right now. Please try again later."
		end
	end




end