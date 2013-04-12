class My::ProjectsController < ApplicationController
  before_filter :require_login 

  def index
    @projects = current_user.projects.all
  end

  def new
    # Prepopulate the current user in the object we're building.

    # Aha moment: This is the first time I've seen a use for constructing
    # an object in the "new" action (rather than just doing form_for Project.new).
    @project = current_user.projects.build
  end

  def edit

    # Note: I originally had a begin/rescue here to handle 
    # record not found. But there's some magic in Rails
    # around ActiveRecord::RecordNotFound exceptions:
    # * in DEV, we show a 500 with a stack trace
    # * in PROD, we render the static 404 page.

    # So we actually don't need to handle this explicitly,
    # unless we want a fancier message. Just let the find
    # below throw, and we get a 404.

    @project = current_user.projects.find params[:id]

  end

  def create
    project = current_user.projects.build params[:project]

    if project.save
      redirect_to my_projects_path, :notice => "Project #{project.title} was created."
    else
      render :new
    end

  end
end
