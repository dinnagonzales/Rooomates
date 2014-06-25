class UsersController < ApplicationController
  respond_to :html, :json

  def new
    @user = User.new
  end



  def create
    @user = User.new(user_params)
 

    if @user.save
      flash[:success] = "You have signed up successfully."
       @current_user = @user
       session[:user_id] = @user.id.to_s
       redirect_to users_path
    else
      flash[:error] = @user.errors
      redirect_to root_path
    end
  end

  def index
    @users = User.all
    respond_with current_user
    
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
    params.require(:user).permit(:name, :age, :gender, :city, :state, :email, :password, :avatar)
  end
  
  
end
