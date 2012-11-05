class EventsController < ProjectBaseController

  before_filter :find_event, :only => [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = @project.events

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = @project.events.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = @project.events.build(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to project_event_path(@project, @event), notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to project_event_path(@project, @event), notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy

    respond_to do |format|
      format.html { redirect_to project_events_path(@project) }
      format.json { head :no_content }
    end
  end


  private

  def find_event
    @event = @project.events.find(params[:id])
    raise 'no event' unless @event
  end
end
