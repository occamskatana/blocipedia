class CollaboratorsController < ApplicationController

	def new
		@collaborator = Collaborator.new
		@wiki_id = params[:wiki_id]
	end

	def create
		user = User.find_by_name(params[:user_name])
		if user
			@collaborator = Collaborator.new(wiki_id: params[:wiki_id], user_id: user.id)
			if @collaborator.save
				flash[:notice] = "Yes it worked."
				redirect_to wiki_path(@collaborator.wiki_id)
			else
				flash[:error] = "Did not work."
			end
		else
			flash[:error] = "User does not exist"
			redirect_to new_collaborator_path(wiki_id: params[:wiki_id])
		end
	end

	def destroy

	end

	private

	def collaborator_params
		params.require(:collaborator).permit(:user_id, :wiki_id)
	end

end