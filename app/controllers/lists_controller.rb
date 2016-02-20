class ListsController < ApplicationController

  before_action :logged_in?, only: [:new, :create, :edit, :update, :destroy]

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    current_user.lists << @list
    if @list.save
      flash[:notice] = "Successfully created list."
      redirect_to list_path(@list)
    else
      flash[:error] = @list.errors.full_messages.join(", ")
      redirect_to new_list_path
    end
  end

  def show
    @list = List.find_by_id(params[:id])
  end

  def edit
    @list = List.find_by_id(params[:id])
    unless current_user == @list.user
      redirect_to user_path(current_user)
    end
  end

  def update
    @list = List.find_by_id(params[:id])
    if current_user == @list.user
      if @list.update_attributes(list_params)
        flash[:notice] = "Successfully updated list."
        redirect_to list_path(@list)
      else
        flash[:error] = @list.errors.full_messages.join(", ")
        redirect_to edit_list_path(@list)
      end
    else
      redirect_to user_path(current_user)
    end
  end

  def destroy
    @list = List.find_by_id(params[:id])
    if current_user == @list.user
      @list.destroy
      flash[:notice] = "Successfully deleted list."
    end
    redirect_to user_path(current_user)
  end

  private

  def list_params
    params.require(:list).permit(:title, :description)
  end

end
