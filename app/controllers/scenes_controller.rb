class ScenesController < ApplicationController

  def index
    @scenes = Scene.all
  end

  def show
    @scene = Scene.find_by_id(params[:id])
    if current_user
      @user_lists = current_user.lists
    else
      @user_lists = ""
    end
  end

end
