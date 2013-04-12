class HomeController < ApplicationController
  def home
  end

  protected
  def set_nav_state
    @nav = "home"
  end
end