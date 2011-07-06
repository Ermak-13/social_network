class Admin::BansController < Admin::BaseAdminController
  before_filter :initialize_user, :only => [:create, :destroy]
  
  def index
    @users = User.all
  end
  
  def create
    @user.ban!
    redirect_to :action => :index
  end
  
  def destroy
    @user.unban!
    redirect_to :action => :index
  end
  
  def new
    @user=User.new
  end
  
  private
  
  def initialize_user
    @user = User.find_by_id(params[:id])
    unless @user
      redirect_to admin_bans_path, :alert => "No such user"
    end
  end
end