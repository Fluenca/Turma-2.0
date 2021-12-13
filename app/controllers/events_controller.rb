class EventsController < ApplicationController
  def index
    @events = Event.where(user_id: current_user.id)
    start_date = params.fetch(:date, Date.today).to_date
    @events_month = Event.where(date: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week).where(user_id: current_user.id)


    if params[:query].present?
      sql_query = "name ILIKE :query OR category ILIKE :query"
      @events = Event.where(sql_query, query: "%#{params[:query]}%")
    else
      @events = Event.where(user: current_user) + Event.joins(:invitations).where(invitations: { user: current_user }, invitations: { status: true } )
      @events.uniq!
    end
# find all events where user_id is current_user.id OR event.invitations.user_id = current_user.id
  end

  def show
    @event = Event.find(params[:id])
    @invitation = Invitation.new
    @message = Message.new
    @markers = [{ lat: @event.latitude, lng: @event.longitude }]
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    redirect_to event_path(@event)
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  private



  def event_params
    params.require(:event).permit(:travel, :date, :accomodation, :food, :category, :technician, :rider, :driver, :name, :address, :photo, :performers, :guestlist)
  end
end
