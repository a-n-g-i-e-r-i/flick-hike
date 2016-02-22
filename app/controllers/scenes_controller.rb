class ScenesController < ApplicationController

  def index
    @scenes = Scene.all
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
