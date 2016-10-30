class TicketTypesUser < ActiveRecord::Base
  belongs_to :ticket_type
  belongs_to :user
end
