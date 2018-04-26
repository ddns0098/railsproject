class TeamsController < ApplicationController
  before_action :require_login

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)

    if @team.save
      redirect_to admin_path
    else
      render 'new'
    end
  end

  def edit
    @team = find_team
  end

  def update
    @team = find_team
    if @team.update(team_params)
      redirect_to admin_path
    else
      reder 'edit'
    end
  end

  def destroy
    @params = find_team
    @team.destroy
    redirect_to admin_path
  end

  private

  def require_login
    unless admin_signed_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_admin_session_path # halts request cycle
    end
  end

  def team_params
    params.require(:team).permit(:avatar, :name, :apprentice_ids => [])
  end

  def find_team
    @team = Team.find(params[:id])
  end
end
