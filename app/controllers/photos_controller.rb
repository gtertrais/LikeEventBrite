class PhotosController < ApplicationController
  def create
    
    @event = Event.find(params[:event_id])
    @event.photos.attach(params[:photos])
    redirect_to(event_path(@event))
  end
end