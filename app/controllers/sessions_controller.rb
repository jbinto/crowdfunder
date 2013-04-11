class SessionsController < ApplicationController
  def new
  end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_to :root, :notice => "You are now signed in."
    else
      flash[:alert] = "Invalid username or password. Try again."
      redirect_to sign_in_path
    end
  end

  def destroy
    logout
    redirect_to :root, notice: "You have been signed out."
  end
end