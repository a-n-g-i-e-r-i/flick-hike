class ScenesController < ApplicationController

  def index
    @scenes = Scene.all
    ########################
    if params[:search]
    @scenes = Scene.search(params[:search]).order("created_at DESC")
  else
    @scenes = Scene.all.order('created_at DESC')
  end
  end

  def show
    @listscene = ListScene.new
    @scene = Scene.find_by_id(params[:id])
    if current_user
      @user_lists = []
      @temp_lists = current_user.lists
      @temp_lists.each do |a|
        if !a.scenes.find_by_id(@scene.id)
          @user_lists << a
        end
      end
    else
      @user_lists = ""
    end
  end

end
