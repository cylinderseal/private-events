class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  
  def index
    if params[:tag]
      @events = Event.tagged_with(params[:tag])
    else
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
    @event = Event.find(params[:id])
  end
  
  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to @event
    else
      render 'edit'
    end
  end

  def show
    @event = Event.find(params[:id])
  end
  
  private
  
    def event_params
      params.require(:event).permit(:title, :description, :date, :location, :tag_list)
    end
end