class UserAwareController < ApplicationController
  before_filter :authenticate_user!
  
  protected
  
  def user
    @user ||= User.find_by_id(params[:user_id] || params[:id] || current_user.id)
  end
  helper_method :user
end