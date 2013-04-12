class ProjectsController < ApplicationController
  def index
    @projects = Project.latest.page params[:page]
  end

  def show
    @project = Project.find(params[:id])
  end

  protected
  def set_nav_state
    @nav = "projects"
  end
end