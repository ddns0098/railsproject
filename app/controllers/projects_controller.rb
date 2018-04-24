class ProjectsController < ApplicationController
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

  def project_params
    params.require(:project).permit(:title, :description)
  end

  def find_project
    @project = Project.find(params[:id])
  end
end
