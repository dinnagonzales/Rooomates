class ProfilesController < ApplicationController
  before_action :set_profile, :only => [:show, :edit, :update, :destroy]
  before_action :setuser
  respond_to :json, :html

  def index
    @profiles = Profile.all
    respond_with @profiles
  end

  def show
    respond_with @profiles
  end


  def edit
   
  end

  
  def update
    
    if @Profile.update_attributes(profile_params)
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def new
    @profile = Profile.new
  end


  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    @profile.avatar_file_name = current_user.avatar.url
    p @profile.avatar_file_name
    

    
    if @profile.save
      respond_to do |format|
      format.html {redirect_to :back}
      format.json {render json: @profile, status: :created}
  
    end
    else
      respond_to do |format|
      format.html {render 'edit'}
      format.json {render json: @profile.errors, status: :unprocessable_entity}
      end
    end
  end

 

  protected
  def set_profile
    @profile = Profile.find(params[:id])
  end

  def setuser
    @user = current_user
  end

  def profile_params
    params.require(:profile).permit(:cleanliness, :noise_tolerance, :visitors, :pets, :smoking, :sleeping_hours, :cooks, :lifestyle, :interests, :notes, :avatar_file_name)
  end

end
