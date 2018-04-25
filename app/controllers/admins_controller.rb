class AdminsController < ApplicationController
  before_action :require_login

  def index
    @projects = Project.all
  end

  private

  def require_login
    unless admin_signed_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_admin_session_path # halts request cycle
    end
  end
end
