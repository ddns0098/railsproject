class ApprenticesController < ApplicationController
  before_action :require_login

  def new
    @apprentice = Apprentice.new
  end

  def create
    @apprentice = Apprentice.new(apprentice_params)

    if @apprentice.save
      redirect_to admin_path
    else
      render 'new'
    end
  end

  def edit
    @apprentice = find_apprentice
  end

  def update
    @apprentice = find_apprentice
    if @apprentice.update(apprentice_params)
      redirect_to admin_path
    else
      reder 'edit'
    end
  end

  def destroy
    @params = find_apprentice
    @apprentice.destroy
    redirect_to admin_path
  end

  private

  def require_login
    unless admin_signed_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_admin_session_path # halts request cycle
    end
  end

  def apprentice_params
    params.require(:apprentice).permit(:name, :git)
  end

  def find_apprentice
    @apprentice = Apprentice.find(params[:id])
  end
end
