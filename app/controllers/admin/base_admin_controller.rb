class Admin::BaseAdminController < ApplicationController
  before_filter :ensure_admin
  
  private
  
  def ensure_admin
    redirect_to root_path, :alert => "Must be admin" unless current_user.try(:admin?)
  end
end
