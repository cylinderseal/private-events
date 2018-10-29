class AttendancesController < ApplicationController
  def create
    event = Event.find(params[:attended_event])
    current_user.attend(event)
    redirect_to event
  end

  def destroy
    event = Attendance.find(params[:id]).attended_event
    current_user.cancel(event)
    redirect_to event
  end
end
