class PotentialsController < ApplicationController
  before_action :setuser
  respond_to :json, :html

  def index
    @potentials = Potential.where(:user_id => current_user.id)
    respond_with @potentials
  end

  def show
    @potentials = Potential.where(:user_id => current_user.id)
    respond_with @potentials
  end

  def edit
  end

  
  def update
    
    if @Potential.update_attributes(potential_params)
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def new
    @potential = Potential.new
  end

  def create
    @potential = Potential.new(potential_params)
    @potential.user_id = current_user.id
    
    if @potential.save
      respond_to do |format|
      format.html {redirect_to users_path}
      format.json {render json: @potential, status: :created}
    end
    
    else
      respond_to do |format|
      format.html {render 'edit'}
      format.json {render json: @potential.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
  end

  protected

   def setuser
    @user = current_user
  end



  def potential_params
    params.require(:potential).permit(:favorable_id, :favorable_type, :user_id)
  end


end
