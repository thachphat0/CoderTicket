require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "#upcoming" do
    it "return [] when there are no events" do
    	expect(Event.upcoming).to eq []
    end

    it "return [] when there are only past events" do
    	Event.create!(starts_at: 2.days.ago, ends_at: 1.day.ago, extended_html_description: " a past event",
                venue: Venue.new, category: Category.new)
    	expect(Event.upcoming).to eq []
    end

    it "return [b] when there are a past event 'a' and a future event 'b'" do
    	venue = Venue.new
    	category = Category.new
    	a = Event.create!(starts_at: 2.days.ago, ends_at: 1.day.ago, extended_html_description: " a past event",
                venue: venue, category: category, name: 'a')
    	b = Event.create!(starts_at: 2.days.ago, ends_at: 1.day.from_now, extended_html_description: " a future event",
                venue: venue, category: category, name: 'b')
    	expect(Event.upcoming).to eq [b]
    end
  end
end
