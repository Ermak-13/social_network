class UsersController < UserAwareController
  
  def show
  end
  
  def update
    if user.update_attributes(params[:user])
      flash.now[:notice] = "Profile updated successfully"
    else
      flash.now[:alert] = "Error saving profile!"
    end
    respond_to do |format|
      format.js
      format.html { render :show }
    end
  end

end