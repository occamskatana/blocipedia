class WikiPolicy < ApplicationPolicy
  attr_reader :user, :wiki

  def initialize(user, wiki)
  	@user = user
  	@wiki = wiki
  end

  def destroy?
  	user.admin?
  end
	
 def new
 	user.present?
 end

 def edit
 	user.present?
 end

 def update
 	user.present?
 end

  
end
