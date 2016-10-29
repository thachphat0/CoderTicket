class EventsController < ApplicationController

	skip_before_filter :require_login, only: [:index, :show]

	def index
		if params[:search]
			@events = Event.upcoming(params[:search])
		else
			@events = Event.upcoming('')
		end
	end

	def show
		@event = Event.find(params[:id])
	end

	def new
		@event = Event.new
	end

	def create
		if current_user
			@event = Event.new(event_params)
			if @event.hero_image_url.blank?
				@event.hero_image_url = 'https://az810747.vo.msecnd.net/eventcover/2015/12/12/78534E.jpg?w=1040&maxheight=400&mode=crop&anchor=topcenter'
			end
			if @event.save
				redirect_to root_path, flash: {success: 'Event created!'}
			else
				flash[:danger] = @event.errors.full_messages.to_sentence
				render 'new'
			end
		end
	end

	private
	def event_params
		params.require(:event).permit("starts_at", "ends_at", "venue_id", "hero_image_url", "extended_html_description", "category_id", "name", "user_id")
	end
end
