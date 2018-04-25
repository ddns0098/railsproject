class ProjectsController < ApplicationController
  before_action :require_login

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to admin_path
    else
      render 'new'
    end
  end

  def edit
    @project = find_project
  end

  def update
    @project = find_project
    if @project.update(project_params)
      redirect_to admin_path
    else
      reder 'edit'
    end
  end

  def destroy
    @params = find_project
    @project.destroy
    redirect_to admin_path
  end

  private

  def require_login
    unless admin_signed_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_admin_session_path # halts request cycle
    end
  end

  def project_params
    params.require(:project).permit(:avatar, :title, :description)
  end

  def find_project
    @project = Project.find(params[:id])
  end
end
