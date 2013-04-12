class My::ProjectsController < ApplicationController
  before_filter :require_login 

  def index
    @projects = current_user.projects.all
  end

  def new
  end

  def edit
  end

  def create

  end
end
