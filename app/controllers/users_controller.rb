class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # => app/views/users/show.html.slim
  end

  def new
    @user = User.new
  end

  # POST /users
  def create
    @user = User.new(user_params)
    # @user = User.new(params[:user])
    # @user = User.new(params.require(:user).permit(:name, :email, :password, :password_confirmation))
    # params[:user][:name]
    # params[:user][:email]
    # params[:user][:password]
    if @user.save # => Validation
      # Success
      flash[:success] = 'Welcome to the Sample App!'
      # redirect_to "/users/#{@user.id}"
      # redirect_to user_path(@user.id)
      # redirect_to user_path(@user)
      redirect_to @user # GET "/users/#{{@user.id}" => show

    else
      # Failure
      render 'new'
    end
  end

  def user_params
    params.require(:user).permit(
      :name,
      :email, :password,
      :password_confirmation)
  end
end
