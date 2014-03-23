class ProfilesController < ApplicationController

  def index
    @profiles = Profile.all
  end

  def edit
    @user = current_user
    @profile = @user.profile
    @bands = Band.where(profile_id: @profile.id)
  end

  def show
    @user = User.find_by_username(params[:username])
    @profile = @user.profile
    @bands = @profile.bands
  end



  #
  #def update
  #  @user = current_user
  #  @profile = @user.profile
  #
  #  if @profile.update_for_profile(profile_params)
  #    flash[:notice] = "Profile Update"
  #    redirect_to profile_path(current_user)
  #  else
  #    render :edit
  #  end
  #end
  #
  #def destroy
  #end

  private
  def profile_params
    params.require(:profile).permit(:bio, :username, :name, bands_attributes: [:id, :name, :_destroy])
  end

end
