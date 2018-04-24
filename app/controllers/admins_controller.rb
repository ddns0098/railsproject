class AdminsController < ApplicationController
  def index
    @projects = Project.all
  end
end
