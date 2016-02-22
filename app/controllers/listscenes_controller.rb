class ListscenesController < ApplicationController

  def create
    @scene = Scene.find_by_id(params[:list_scene][:scene_id])
    # assign list to @listscene
    @lists = []
    @flash_notices = []
    @list_ids = params[:list_scene][:list_id]
    @list_ids.each do |l|
      if l.empty? do |a|
        @list_ids.delete(a)
      end
      else
        @list = List.find_by_id(l)
        @listscene = ListScene.new
        # assign list_id to @listscene
        @scene.lists << @list
        @lists << @list
        if @listscene.save
          @flash_notices << @list.title
        end
      end
    end
    if @listscene.save
      flash[:notice] = "Successfully added #{@scene.title} to the following lists: #{@flash_notices.join(", and ")}"
      redirect_to scene_path(@scene)
    else
      flash[:error] = @list.errors.full_messages.join(", ")
      redirect_to(:back)
    end
  end

end
