class PhotosController < UserAwareController
  
  def index
    @photos = Photo.find_all_by_user_id(user.id)
  end
  
  def create
    @photo = Photo.create(params[:photo].merge({ :user => current_user }))
    redirect_to :action => :index
  end
  
  def destroy
    Photo.find_by_id(params[:id]).destroy
    redirect_to :action => :index
  end
    
end