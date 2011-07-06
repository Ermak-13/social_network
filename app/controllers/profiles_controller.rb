class ProfilesController < ApplicationController
  def show
  end

  def edit
  end

  def new
    @profile=Profile.new
  end

  def create
    @profile.save
  end
end
