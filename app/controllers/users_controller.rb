class UsersController < ApplicationController
  def index
  	
  end

  def new
  	@user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
  	if @user.save
      session[:id] = @user.id
    	redirect_to @user, notice: "New user created." # @user is the same as user_path(@user.id)
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  def update
    @user = User.find(params[:id])
  	if @user.update(user_params)
    	redirect_to @user, notice: "User successfully updated."
    else
      flash[:alert] = "Something went wrong."
      render :edit
    end
  end

  def destroy
    if session[:id] == @user.id
      session[:id] = nil
    	@user.destroy
    	redirect_to root_path, notice: "User deleted."
    else
      redirect_to root_path, alert: "Unable to process request"
    end
  end

	private

	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation, :phone, :fname, :lname)
	end

end