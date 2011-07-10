class MicropostsController < UserAwareController
  
  def index    
    @microposts = Micropost.where("user_id = ? AND id > ?", 
      user.id, params[:micropost_id].presence || 0).page(params[:page] || 1).per(2)    
    render :partial => "micropost", :collection => @microposts
  end
  
  def create
    Micropost.create!(params[:micropost])
    render :nothing => true
  end
end
