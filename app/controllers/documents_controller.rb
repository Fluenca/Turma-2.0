class DocumentsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @document = Event.new
    @document.event = @event
    if @message.save
      redirect_to event_path(@event)
    else
      render "events/show"
    end
  end
end
