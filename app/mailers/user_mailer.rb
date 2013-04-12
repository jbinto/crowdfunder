class UserMailer < ActionMailer::Base
  default from: "crowdfunder@example.org"

  def new_pledge(pledge)
    @pledge = pledge
    @project = pledge.project
    @user = @project.user
    @backer = @pledge.user

    mail(:to => @user.email, :subject => "#{@project.title} has been backed by #{@user.full_name}!")
  end
end
