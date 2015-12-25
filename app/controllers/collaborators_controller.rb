class CollaboratorsController < ActionController::Base

	def new 

		@collaborator = Wiki.find(params[:wiki_id]).users.new

	end


	def create
		@collaborator = Collaborator.new(collaborator_params)

		if @collaborator.save
			flash[:notification] = "saved"
		else
			flash[:error] = "stupid"
		end

	end


	def destroy

	end

	private

	def collaborator_params
		params.require(:collaborator).permit(:user_id, :wiki_id)
	end

end