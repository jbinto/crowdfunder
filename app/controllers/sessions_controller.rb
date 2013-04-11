class SessionsController < ApplicationController
  def new
  end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_to :root, :notice => "You are now signed in."
    else
      flash.now[:alert] = "Invalid username or password. Try again."
      render :new
    end
  end

  def destroy
    logout
    redirect_to :root, notice: "You have been signed out."
  end
end