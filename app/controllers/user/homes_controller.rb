class User::HomesController < User::BaseUserController
  def index
  end
  
  def show
  end
  
  private
  
  #  def after_sign_in_path_for(resource)
  #  if resource.is_a?(User) && resource.banned?
  #    flash[:alert] = "You are BANNED!!!"
  #    new_user_session_path
  #  else
  #    super
  #  end
  #end
end
