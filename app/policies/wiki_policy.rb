class WikiPolicy 
  attr_reader :user, :wiki

  def initialize(user, wiki)
  	raise Pundit::NotAuthorizedError, "You must be an admin to do that" unless user.admin?
  	@user = user
  	@wiki = wiki
  end

  def destroy?
  	user.admin?
  end
	
 

  
end
