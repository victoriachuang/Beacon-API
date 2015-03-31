class EventsController < ApplicationController

  after_filter :cors_set_access_control_headers

  def index
    events = Event.all
    render :json => events
  end

  def create
    event = Event.new(events_params)
    error_messages = []
    if event.save
      render :json => event
    else error_messages = event.errors.full_messages
      render :json => error_messages
    end
  end

  def show
    event = Event.find(params[:id])
    render :json => event
  end

  def update
    event = Event.find(params[:id])
    event.increment!(:people_count)
    render :json => event
  end

  private

  def events_params
    params.permit(:title, :description, :location, :date_start,:date_end, :category, :people_count)
  end

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
    headers['Access-Control-Max-Age'] = "1728000"
  end

end
