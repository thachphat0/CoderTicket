class TicketTypesUsersController < ApplicationController
	def create
		event = Event.find(params[:event_id])
		total_quantity = 0
		event.ticket_types.each do |t|
			quantity = params["quantity-#{t.id}"].to_i
			total_quantity += quantity
		end
		if total_quantity > 0 and total_quantity <= 10
			event.ticket_types.each do |t|
				quantity = params["quantity-#{t.id}"].to_i
				if quantity > 0
					ticket_types_users = TicketTypesUser.new(quantity: quantity, ticket_type_id: t.id, user_id: current_user.id)
					if !ticket_types_users.save
						redirect_to :back, flash: {danger: ticket_types_users.errors.full_messages.to_sentence}
					end
				end
			end
			redirect_to root_path, flash: {success: 'Buy ticket success'}
		else
			redirect_to :back, flash: {danger: 'Please buy at least a ticket and less than 10 tickets.'}
		end
	end
end
