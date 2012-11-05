class ProjectsController < ApplicationController

  before_filter :find_project, :only => [:show, :edit, :update, :destroy]

  def index
    @projects = current_user.projects
  end

  def show
    @events = @project.events
  end

  def new
    @project = current_user.projects.build
  end

  def edit
  end

  def create
    @project = current_user.projects.create(params[:project].merge(:creator_id => current_user.id))

    if @project.valid?
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render :new
    end
  end

  def update
    if @project.update_attributes(params[:project])
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end


  private

  def find_project
    @project = current_user.projects.find(params[:id])
  end
end
