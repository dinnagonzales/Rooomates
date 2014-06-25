class UsersController < ApplicationController
  

  def new
    @user = User.new
  end

  def me
    respond_with current_user
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
    p current_user
    @users = User.all

    # @potentials= Potential.where(:user_id => current_user.id)
    
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
    params.require(:user).permit(:name, :age, :gender, :city, :state, :email, :password)
  end
  
  
end
