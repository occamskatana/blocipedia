class ApplicationController < ActionController::Base


	
	include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :define_user
	  protected

	  def configure_permitted_parameters
	  	devise_parameter_sanitizer.for (:sign_up) {|u|	
	  		  		u.permit(:name, :email, :password, :password_confirmation)
	  		  	}
	  end

	  def define_user
	  	@user = current_user
	  end
	  	  
	end
