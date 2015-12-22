class WikisController < ApplicationController
  def show
  	@wiki = Wiki.find(params[:id])
  end

  def index
  	@wikis = Wiki.all
  end

  def new 
  	@wiki = Wiki.new
  end

  def create
  	@wiki = Wiki.new(wiki_params)

  	if @wiki.save
  		flash[:notice] = "Your wiki was saved"
  	else
  		flash[:error] = "There was a problem saving your wiki."
  	end

  	redirect_to wikis_path
  end

  def destroy 
  	@wiki = Wiki.find(params[:id])

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
  	if @wiki.save
  		flash[:notice] = "Your Wiki was successfully saved"
  		redirect_to @wiki
  	else
  		flash[:error] = "Your wiki could not be saved for some reason"
  	end
  end

  def edit
  	@wiki = Wiki.find(params[:id])
  end

  private

  def wiki_params
  	params.require(:wiki).permit(:title, :body, :private)
  end
end
