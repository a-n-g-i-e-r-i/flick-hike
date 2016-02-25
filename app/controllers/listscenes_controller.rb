class ListscenesController < ApplicationController

  before_action :logged_in?, only: [:create]

  def create
    @listscene = ListScene.new
    @scene = Scene.find_by_id(params[:list_scene][:scene_id])
    # assign list to @listscene
    lists = []
    flash_notices = []
    list_ids = params[:list_scene][:list_id]
    list_ids.each do |l|
      if l.empty? do |a|
        list_ids.delete(a)
      end
      else
        list = List.find_by_id(l)
        # assign list_id to @listscene
        @scene.lists << list
        lists << list
        if @listscene.save
          flash_notices << list.title
        end
      end
    end
    if @listscene.save
      flash[:notice] = "Successfully added #{@scene.title} to the following lists: #{flash_notices.join(", and ")}"
      redirect_to scene_path(@scene)
    else
      flash[:error] = list.errors.full_messages.join(", ")
      redirect_to(:back)
    end
  end

  def create_multiple_listscenes
    if current_user
      # render user lists
      @user_lists = current_user.lists
      # create array to store flash notices
      flash_notices = []
      list_titles =[]
      if params[:scene_id]
        # collect array of scene_ids from params
        scene_ids = params[:scene_id]
        scene_ids.each do |l|
          # delete scene_ids element if empty
          if l.empty? do |a|
            scene_ids.delete(a)
          end
          else
            # find scene by scene_ids element
            scene = Scene.find_by_id(l)
            # store title for flash notice
            title = scene.title
            @user_lists.each do |a|
              # push scene into a.scenes already in a.scenes
              a << scene unless a.scenes.find_by_id(scene.id)
              list_titles << a.title
            end
            flash_notices << title
          end
        end
      end
      if !list_titles.empty?
        flash[:notice] = "Successfully added the following scenes: #{flash_notices.join(", and ")} to the following lists #{list_titles.join(", and ")}"
      end
    else
      @user_lists = ''
    end
  end

end
