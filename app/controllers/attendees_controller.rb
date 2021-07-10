class AttendeesController < ApplicationController
  def new
    helpers.signed_in_only
    #@event = Event.new
    @attendee= Attendee.new
  end

  def create
    helpers.signed_in_only
    @attendee= Attendee.new(user_id=current_user.id, event_id=event_event_id, userame=current_user.email)
   


    respond_to do |format|
      if @attendee.save
        format.html { redirect_to @attendee, notice: "Event was successfully created." }
        format.json { render :show, status: :created, location: @attendee }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @attendee.errors, status: :unprocessable_entity }
      end
    end
  end

end
