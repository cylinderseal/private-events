class EventsController < ApplicationController
  before_action :set_event, except: [:index, :new, :event_owner]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :event_owner, only: [:edit, :update, :destroy]
  
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
      flash[:success] = "Created new event"
      redirect_to @event
    else
      render 'new'
    end
  end

  def edit
  end
  
  def update
    if @event.update(event_params)
      flash[:success] = "Edit successfull"
      redirect_to @event
    else
      render 'edit'
    end
  end

  def show
    @user = User.first
  end
  
  def destroy
    
  end
  
  private
  
    def event_params
      params.require(:event).permit(:title, :description, :date, :location, :tag_list)
    end
    
    def set_event
      @event = Event.find(params[:id])
    end
    
    def event_owner
      unless @event.creator_id == current_user.id
        flash[:notice] = 'Access denied as you are not the creator of the event'
        redirect_to root_path
      end
    end
end