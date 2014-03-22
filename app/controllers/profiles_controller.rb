class ProfilesController < ApplicationController

  def index
    @profiles = Profile.all
  end

  def edit
    @user = current_user
    @profile = @user.profile
  end

  def show
  end

  def new
  end

  def create
  end

  def update
  end

  def destroy
  end
end
