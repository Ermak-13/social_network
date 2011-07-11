class UserAwareController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_banned
  
  protected
  
  def check_banned
    if current_user.banned?
      sign_out current_user
      redirect_to root_path
    end
  end
  
  def user
    @user ||= User.find_by_id(params[:user_id] || params[:id] || current_user.id)
  end
  helper_method :user
end