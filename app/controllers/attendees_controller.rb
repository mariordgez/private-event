class AttendeesController < ApplicationController
  def new
    helpers.signed_in_only
    # @event = Event.new
    @attendee = @event.attendees.build
  end

  def create
    helpers.signed_in_only
    @event = Event.find(params[:event_id])
    @attendee = @event.attendees.build(attendee_params)
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Attende was successfully registered.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event = Event.find(params[:event_id])
    @attendee = @event.attendees.find(params[:id])
    @attendee.destroy
    redirect_to article_path(@article)
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'attendee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def attendee_params
    params.require(:attendee).permit(:userame, :user_id)
  end
end
