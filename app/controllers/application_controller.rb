class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_nav_state

  # Called by Sorcery
  def not_authenticated
    redirect_to sign_in_url, :notice => "Please sign in."
  end

end
