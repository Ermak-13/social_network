class UsersController < UserAwareController
  before_filter :load_microposts, :only => :show
  
  def show
  end
  
  def update
    if user.update_attributes(params[:user])
      flash[:notice] = "Profile updated successfully"
    else
      flash[:alert] = "Error saving profile!"
    end
  end
  
  private
  
  def user
    @user ||= User.find_by_id(params[:id] || current_user.id)
  end
  helper_method :user
  
  def load_microposts
    @user = User.with_microposts.with_profile.find_by_id(params[:id] || current_user.id)
  end
end