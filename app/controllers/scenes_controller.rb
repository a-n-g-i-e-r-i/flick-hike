class ScenesController < ApplicationController

  def index
    @scenes = Scene.all
  end

  def show
    @scene = Scene.find_by_id(params[:id])
  end

end
