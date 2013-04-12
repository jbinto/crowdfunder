class My::ImagesController < ApplicationController

  before_filter :get_project

  def index
    @images = @project.images.order(:id)

    # This is really for the 'new', but we don't have a 'new' action.
    @image = @project.images.build
  end

  def create
    @image = @project.images.build(params[:image])
    if @image.save
      redirect_to [:my, @project, :images], notice: "Image uploaded."
    else
      # Error saving image. 
      @images = @project.images
      render :index
    end
  end

  protected
  def get_project
    @project = Project.find(params[:project_id])
  end

  def set_nav_state
    @nav = "my/projects"
  end

end