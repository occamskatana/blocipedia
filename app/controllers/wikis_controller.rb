class WikisController < ApplicationController
  
  

  def show
    
  	@wiki = Wiki.find(params[:id])
    authorize @wiki
  end

  def index
  	@wikis = policy_scope(Wiki)
    @all = Wiki.all
    
  end

  def new 
  	@wiki = Wiki.new
  end

  def create
  	@wiki = Wiki.new(wiki_params)
    authorize @wiki

  	if @wiki.save
  		flash[:notice] = "Your wiki was saved"
  	else
  		flash[:error] = "There was a problem saving your wiki."
  	end
    
  	redirect_to wikis_path
  end

  def destroy 
  	@wiki = Wiki.find(params[:id])
    authorize @wiki
  	if @wiki.destroy
  		flash[:notice] = "Your wiki was successfully destroyed"
  	else
  		flash[:error] = "Your wiki could not be destroyed"
  	end

  	redirect_to wikis_path
  end

  def update
  	@wiki = Wiki.find(params[:id])
  	@wiki.assign_attributes(wiki_params)
    @user = User.find(params[:id])

  	if @wiki.save
  		flash[:notice] = "Your Wiki was successfully saved"
        
  		redirect_to @wiki
  	else
  		flash[:error] = "Your wiki could not be saved for some reason"
  	end
  end

  def edit
  	@wiki = Wiki.find(params[:id])
    @collabs = @wiki.collaborators.each {|x| x.user}
  end

  private

  def wiki_params
  	params.require(:wiki).permit(:title, :body, :private, :user)
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action. Please sign in"
    redirect_to(request.referrer || root_path)
  end

  

end
