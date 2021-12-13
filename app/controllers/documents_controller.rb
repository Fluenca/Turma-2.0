class DocumentsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @document = Event.new(document_params)
    @document.event = @event
    if @document.save
      redirect_to event_path(@event)
    else
      render "events/show"
    end
  end

  def document_params
    params.permit(:name, :photo, :event_id)
  end
end
