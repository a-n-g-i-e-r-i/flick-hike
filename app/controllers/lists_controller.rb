class ListsController < ApplicationController

  autocomplete :list, :title
  before_action :logged_in?, only: [:new, :create, :edit, :update, :destroy]

  def index
    @lists = List.all
    if params[:search]
      @lists = List.title_like("%#{params[:search]}%").order('title')
    end
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    # assign user to @list
    @list.user = current_user
    # select scene by scene id
    @scene = Scene.find_by_id(params[:scene_id])
    # if checkbox is true, add scene to list
    if @scene
      # assign scene to @list
      @list.scenes << @scene
    end
    if @list.save
      flash[:notice] = "Successfully created list."
      redirect_to list_path(@list)
    else
      flash[:error] = @list.errors.full_messages.join(", ")
      redirect_to(:back)
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
      flash_notices = []
      scene_ids = params[:scene_id]
      if scene_ids
        scene_ids.each do |l|
          if l.empty? do |a|
            scene_ids.delete(a)
          end
          else
            scene = Scene.find_by_id(l)
            title = scene.title
            listscene = ListScene.where({scene_id: scene.id, list_id: @list.id})
            ListScene.destroy(listscene)
            flash_notices << title
          end
        end
      end
      if @list.update_attributes(list_params)
        flash[:notice] = "Successfully updated your #{@list.title} list, and from it removed the following scenes: #{flash_notices.join(", and ")}"
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

  def batch_add
    qwerty
  end

  private

  def list_params
    params.require(:list).permit(:title, :description)
  end

end
