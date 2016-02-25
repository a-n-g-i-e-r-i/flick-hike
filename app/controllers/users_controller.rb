class UsersController < ApplicationController
  before_action :logged_in?, only: [ :edit, :update, :destroy]
  before_action :logged_out?, only: [:new, :create]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      flash[:notice] = "#{@user.username}, you successfully created an account"
      login(@user)
      redirect_to user_path(@user)
    else
      flash[:error] = @user.errors.full_messages.join(', ')
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def edit
    @user = User.find_by_id(params[:id])
    unless current_user == @user
      redirect_to user_path(@user)
      flash[:notice] = "You can't edit that user"
    end
  end

  def update
    user_id = params[:id]
    user = User.find_by_id(user_id)
    if current_user == user
      if user.update_attributes(user_params)
        flash[:notice] = "Successfully updated user info"
        redirect_to user_path(user)
      else
        flash[:error] = user.error.full_messages.join(", ")
        redirect_to edit_user_path(user)
      end
    else
      redirect_to user_path(current_user)
    end
  end

  def destroy
    @user = User.find_by_id(params[:id])
    if current_user == @user
      @user.destroy
      flash[:notice] = "Successfully deleted #{@user.username}"
      redirect_to users_path
    else
      flash[:notice] = "You can't handle the truth!"
      redirect_to user_path(@user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :description, :email, :password)
  end

end
