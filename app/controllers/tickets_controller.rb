class TicketsController < ApplicationController
	skip_before_filter :require_login
  def new
    @event = Event.find(params[:event_id])
  end
end
