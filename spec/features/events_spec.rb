require 'rails_helper'

RSpec.feature "Events", type: :feature do
  scenario "click on event to show event detail" do
  	event = FactoryGirl.create(:event, name: 'New Event', starts_at: 1.day.ago, ends_at: 2.days.from_now)
    visit events_path
    click_link "New Event"
    expect(current_url).to eq event_url(id: event.id)
  end

  scenario 'click on book now' do
  	event = FactoryGirl.create(:event, name: 'New Event', starts_at: 1.day.ago, ends_at: 2.days.from_now, venue: Venue.new)
    visit event_path(id: event.id)
    click_link "BOOK NOW"
    expect(current_url).to eq new_event_ticket_url(event_id: event.id)
  end
end
