class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.where(:email => params[:session][:email]).first

    if @user == nil || !@user.authenticate(params[:session][:password])
      flash[:error] = "Invalid email/password combination"
      render 'new'
    else
      session[:user_id] = @user.id
      @current_user = @user
      redirect_to users_path
    end

  end

  def destroy
    session.delete(:user_id)
    redirect_to :root
  end


end
