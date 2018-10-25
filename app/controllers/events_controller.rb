class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  
  def index
    events = Event.all
    if params[:category] == "past"
      @events = events.past
      return
    elsif params[:category] == "future"
      @events = events.future
      return
    else
      @events = events
    end
  end

  def new
    @event = Event.new
  end
  
  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to @event
    else
      render 'new'
    end
  end

  def edit
  end

  def show
    @event = Event.find(params[:id])
  end
  
  private
  
    def event_params
      params.require(:event).permit(:title, :description, :date, :location)
    end
end