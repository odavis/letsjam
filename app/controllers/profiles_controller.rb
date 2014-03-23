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


    request = 'http://api.musicgraph.com/api/v1/artist/search?api_key=c26e63de67a52b71cfcb1b2fb63a14f2&similar_to='
    @response = HTTParty.get('http://api.musicgraph.com/api/v1/artist/search?api_key=c26e63de67a52b71cfcb1b2fb63a14f2&similar_to=Madonna')
  end




  def update
   @user = current_user
   @profile = @user.profile

   if @profile.update_for_profile(profile_params)
     flash[:notice] = "Profile Update"
     redirect_to root_path
   else
     render :edit
   end
  end


  def common_bands
    @user = current_user
    @profile = @user.profile
    @bands = Band.where(profile_id: @profile.id)
    @band_names = @band.map{|bands| band.name }

  end


  private
  def profile_params
    params.require(:profile).permit(:bio, :username, :name, bands_attributes: [:id, :name, :_destroy])
  end

end
