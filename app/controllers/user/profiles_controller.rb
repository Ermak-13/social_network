class User::ProfilesController < User::BaseUserController
  def index
    @profiles=Profile.all
  end
  
  def show
  end
  
  def new
    @profile=Profile.new
  end

  def edit
  end

  def create
    current_user.profile.create(params[:profile])
    redirect_to :action => :index
  end
  
  def update
    current_user.profile.create(params[:profile])
    redirect_to :action => :show
  end
  
  def destroy
    current_user.profile.destroy
    redirect_to :action => :show
  end
end
