class FriendsController < UserAwareController
  def index
  end

  def create
    if Friendship.create(:user => current_user, :friend => friend)
      render :partial => "friend", :locals => { :friend => friend }
    else
      #error handling
      render :nothing => true
    end
  end

  def destroy
    Friendship.find_by_user_id_and_friend_id(current_user, friend).destroy
    render :nothing => true
  end
  
  private
  
  def friends
    if (params[:search])
      User.search params[:search], :include => :profile#, :conditions => { :id_not => current_user.id }
      #User.where("id <> ?", current_user.id).all#current_user.friends.with_profile      
    else
      @friends ||= current_user.friends.with_profile
    end
  end
  helper_method :friends
  
  def friend
    @friend ||= User.find_by_id(params[:id])
  end

end
