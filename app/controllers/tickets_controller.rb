class TicketsController < ApplicationController
	skip_before_filter :require_login
  def new
    @event = Event.find(params[:event_id])
		if !(@event.is_published && @event.ends_at > Time.now)
			redirect_to root_path
		end
  end

  def create
  	raise 'check for ticket post param'
  end
end
