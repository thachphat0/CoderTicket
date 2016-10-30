class TicketType < ActiveRecord::Base
  belongs_to :event
  has_and_belongs_to_many :users
  has_many :ticket_types_users

  validates_presence_of :name, :price, :max_quantity
  validates_uniqueness_of :name

  def available_quantity
  	[10, max_quantity - ticket_types_users.sum(:quantity)].min
  end
end
