require 'rails_helper'

RSpec.describe TicketType, type: :model do

  describe "#available_quantity" do

	  before(:each) do
    	@event = FactoryGirl.create(:event, starts_at: 1.day.ago, ends_at: 1.day.from_now)
    	@ticket_type_1 = FactoryGirl.create(:ticket_type, event_id: @event.id)
    	@ticket_type_2 = FactoryGirl.create(:ticket_type, event_id: @event.id, max_quantity: 5)
      @user = FactoryGirl.create(:user, email: 'buyer')
	  end

    it "return 10 when there are no buyers" do
    	expect(@ticket_type_1.available_quantity).to eq 10
    end

    it "return 5 when there are no buyers and available quantity is 5" do
      expect(@ticket_type_2.available_quantity).to eq 5
    end

    it "return 3 when there are a ticket type with max quantity = 5, user bought 2 tickets" do
      FactoryGirl.create(:ticket_types_user, ticket_type: @ticket_type_2, user: @user, quantity: 2)
      expect(@ticket_type_2.available_quantity).to eq 3
    end
  end
end
