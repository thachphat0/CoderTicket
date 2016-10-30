class TicketTypesController < ApplicationController
  def new
  	@event = Event.find(params[:event_id])
  	@ticket_type = TicketType.new
  end

  def create
  	@ticket_type = TicketType.new(ticket_type_params)
    @event = Event.find(@ticket_type.event_id)
  	if @ticket_type.save
  		redirect_to @event, flash: {success: 'Ticket Type created'}
  	else
  		flash[:danger] = @ticket_type.errors.full_messages.to_sentence
  		render 'new'
  	end
  end

  private
  def ticket_type_params
  	params.require(:ticket_type).permit(:event_id, :name, :price, :max_quantity)
  end
end
