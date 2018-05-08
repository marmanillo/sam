class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  def new
    @user = @user = User.new
    #debugger
  end
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      flash[:alert] = "Complete the field!!"
      render 'new'
    end
  end
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end