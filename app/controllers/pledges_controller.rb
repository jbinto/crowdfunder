class PledgesController < ApplicationController

  # Note: Sorcery defines this method.
  before_filter :require_login

  def new
    @project = Project.find(params[:project_id])
    @pledge = Pledge.new
  end

  def create
    @project = Project.find(params[:project_id])

    @pledge = @project.pledges.build(
      :amount => params[:pledge][:amount],
      :user => current_user)

    if @pledge.save
      UserMailer.new_pledge(@pledge).deliver
      redirect_to root_path, notice: "Thanks for pledging #{@pledge.amount} to #{@project.title}. (If you don't pay, we will hunt you down.)"
    else
      render :new
    end
  end

  protected
  def set_nav_state
    @nav = "projects"   # yeah, this is a pledge, but that's a subset of Project
  end

end