class WikiPolicy < ApplicationPolicy

  attr_reader :user, :wiki

  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end

  def index
    user.present?
  end

  def destroy?
    user.admin?
  end

  def new
    user.present?
  end

  def create
    user.present?
  end

  def edit
    user.present?
  end

  def show
    user.present? 
  end

  def update
    wiki.collaborators.include(user)
  end

  class Scope 

   		attr_reader :user, :scope, :wiki

   		def initialize(user, scope)
   			@user = user
   			@scope = scope 
   		end

   		def resolve 

        wikis = []

        if user.present?

          if user.admin?
           wikis = scope.all

          elsif user.member?

            all_wikis = scope.all
            all_wikis.each do |wiki|
              if wiki.public? || wiki.collaborators.include?(user) || wiki.user_id == user.id
                wikis << wiki 
              end
            end

          else user.guest?
            all_wikis = scope.all
            all_wikis.each do |wiki|
              if wiki.public? || wiki.collaborators.include?(user) || wiki.user_id == user.id
                wikis << wiki 
              end
            end
          end
        wikis
        else
          raise Pundit::NotAuthorizedError, "must be logged in"
        end 
      end
  end
 	
end
