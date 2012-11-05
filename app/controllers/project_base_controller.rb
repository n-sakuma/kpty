class ProjectBaseController < ApplicationController

  before_filter :find_project

  private

  def find_project
    @project = current_user.projects.find(params[:project_id])
    raise 'no project' unless @project
  end
end
