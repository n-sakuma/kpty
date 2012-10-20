class ThingsController < ApplicationController
  before_filter :find_event, only: [:create, :destroy]

  def create
    @thing = Thing.create(params[:thing])
  end

  def destroy
    @thing = Thing.find(params[:id])
    @thing_type = @thing.type
    @thing.destroy
  end

  private

  def find_event
    @event = Event.find(params[:event_id])
  end
end
