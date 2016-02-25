class ScenesController < ApplicationController

  autocomplete :scene, :film_title

  def index
    @scenes = Scene.all
    if params[:search]
      @scenes = Scene.film_title_like("%#{params[:search]}%").order('film_title')
    end
  end

  def show
    @listscene = ListScene.new
    @scene = Scene.find_by_id(params[:id])
    if current_user
      @user_lists = []
      temp_lists = current_user.lists
      temp_lists.each do |a|
        @user_lists << a unless a.scenes.find_by_id(@scene.id)
      end
    else
      @user_lists = ''
    end
  end

end
