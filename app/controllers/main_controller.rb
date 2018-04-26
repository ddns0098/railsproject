class MainController < ApplicationController
  def index
    @projects = Project.all
    @teams = Team.all.eager_load(:apprentices)
  end
end
