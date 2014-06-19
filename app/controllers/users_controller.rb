class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "You have signed up successfully."
      redirect_to new_sessions_path
    else
      render :new
    end
  end

  def index
    @users =User.all
  end


  def show
  end

  def edit
  end

  def update
  end

  def delete
  end

  protected

  def user_params
    params.require(:user).permit(
        :name, 
        :email, 
        :password,
        :age, 
        :gender,
        :city,
        :state, 
        :cleanliness,
        :noise_tolerance, 
        :visitors, 
        :pets, 
        :smoking, 
        :sleeping_hours, 
        :cooks, 
        :hours, 
        :lifestyle, 
        :interests, 
        :notes)
  end
  
end