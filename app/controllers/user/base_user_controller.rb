class User::BaseUserController < ApplicationController
  before_filter :authenticate_user!
  before_filter :initialize_user
  
  protected
    def initialize_user
      @user=current_user
      @profile=@user.profile
      @microposts=@user.microposts
    end
end
