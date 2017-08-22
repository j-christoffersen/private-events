class EventsController < ApplicationController
  def new
    redirect_to login_path unless logged_in?
    @event = Event.new
  end
  
  def create
    @event = current_user.hosted_events.build(params.require(:event).permit(:name, :location, :date))
    if @event.save
      redirect_to current_user
    else
      render 'new'
    end
  end
  
end
