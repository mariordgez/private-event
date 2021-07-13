class AttendeesController < ApplicationController
  def new
    helpers.signed_in_only
    #@event = Event.new
    @attendee= @event.attendees.build
  end

  def create
    helpers.signed_in_only
    @event = Event.find(params[:event_id])
    @attendee= @event.attendees.build(attendee_params)
    redirect_to event_path(@event)

  end
  def attendee_params
    params.require(:attendee).permit(:userame, :user_id)
  end

end
