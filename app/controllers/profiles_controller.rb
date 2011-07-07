class ProfilesController < ApplicationController
  before_filter :authenticate_user! #выкасить на *уй (через наследование)
  def index
    @profiles=Profile.all
  end
  
  def show
    @profile=current_user.profile
  end
  
  def new
    @profile=Profile.new
  end

  def edit
    @profile=current_user.profile
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
