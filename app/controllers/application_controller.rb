class ApplicationController < ActionController::Base
  protect_from_forgery

  # Called by Sorcery
  def not_authenticated
    redirect_to sign_in_url, :notice => "Please sign in."
  end

end
