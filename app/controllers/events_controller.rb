class EventsController < ProjectBaseController

  before_filter :find_event, :only => [:show, :edit, :update, :destroy]

  def index
    @events = @project.events
  end

  def show
  end

  def new
    @event = @project.events.build
  end

  def edit
  end

  def create
    @event = @project.events.build(params[:event])

    if @event.save
      redirect_to project_event_path(@project, @event), notice: 'Event was successfully created.'
    else
      render :new
    end
  end

  def update
    if @event.update_attributes(params[:event])
      redirect_to project_event_path(@project, @event), notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to project_events_path(@project)
  end


  private

  def find_event
    @event = @project.events.find(params[:id])
    raise 'no event' unless @event
  end
end
