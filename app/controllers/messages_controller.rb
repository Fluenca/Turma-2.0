class MessagesController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @message = Message.new(message_params)
    @message.event = @event
    @message.user = current_user
    if @message.save!
      EventChannel.broadcast_to(
        @event,
        render_to_string(partial: "message", locals: {message: @message})
      )
      #  redirect_to event_path(@event, anchor: "message-#{@message.id}")
    else
      render "events/show"
    end


  end

  def index
    @event = Event.find(params[:event_id])
    @message = Message.new(message_params)
  end

  private

  def message_params
    params.require(:message).permit(:content, :photo)
  end
end
