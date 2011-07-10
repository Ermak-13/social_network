class PhotosController < UserAwareController
  
  def index
    @photos = Photo.where("user_id = ?",user.id).order(:created_at).page(params[:page]).per(9)
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