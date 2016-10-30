require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "#upcoming" do
    it "return [] when there are no events" do
    	expect(Event.upcoming).to eq []
    end

    it "return [] when there are only past events" do
        FactoryGirl.create(:event, starts_at: 2.days.ago, ends_at: 1.day.ago)
    	expect(Event.upcoming).to eq []
    end

    it "return [b] when there are a past event 'a' and a future event 'b'" do
    	a = FactoryGirl.create(:event, starts_at: 2.days.ago, ends_at: 1.day.ago)
    	b = FactoryGirl.create(:event, starts_at: 2.days.ago, ends_at: 1.day.from_now)
    	expect(Event.upcoming).to eq [b]
    end

    it "return [b] when there are 2 future events [a, b] and search for b" do
        a = FactoryGirl.create(:event, starts_at: 2.days.ago, ends_at: 1.day.from_now)
        b = FactoryGirl.create(:event, starts_at: 2.days.ago, ends_at: 1.day.from_now)
        expect(Event.upcoming(b.name)).to eq [b]
    end

    it "return [] when there are 2 future events [a, b] and search for c" do
        a = FactoryGirl.create(:event, starts_at: 2.days.ago, ends_at: 1.day.from_now, name: 'a')
        b = FactoryGirl.create(:event, starts_at: 2.days.ago, ends_at: 1.day.from_now, name: 'b')
        expect(Event.upcoming('c')).to eq []
    end

    it "return [aaa] when there are 2 future events [aaa, bbb] and search for a" do
        a = FactoryGirl.create(:event, starts_at: 2.days.ago, ends_at: 1.day.from_now, name: 'aaa')
        b = FactoryGirl.create(:event, starts_at: 2.days.ago, ends_at: 1.day.from_now, name: 'bbb')
        expect(Event.upcoming('a')).to eq [a]
    end

    it "return [aaa, baa] when there are 2 future events [aaa, baa] and search for a" do
        a = FactoryGirl.create(:event, starts_at: 2.days.ago, ends_at: 1.day.from_now, name: 'aaa')
        b = FactoryGirl.create(:event, starts_at: 2.days.ago, ends_at: 1.day.from_now, name: 'baa')
        expect(Event.upcoming('a')).to eq [a, b]
    end

    it 'return [] when user create new event a and not publish' do
        a = FactoryGirl.create(:event, starts_at: 2.days.ago, ends_at: 1.day.from_now, is_published: false)
        expect(Event.upcoming).to eq []
    end

    it 'return [a] when user create new event a and published' do
        a = FactoryGirl.create(:event, starts_at: 2.days.ago, ends_at: 1.day.from_now, is_published: true)
        expect(Event.upcoming).to eq [a]
    end

    it 'return [a] when user create new events a published and b not published' do
        a = FactoryGirl.create(:event, starts_at: 2.days.ago, ends_at: 1.day.from_now, is_published: true)
        b = FactoryGirl.create(:event, starts_at: 2.days.ago, ends_at: 1.day.from_now, is_published: false)
        expect(Event.upcoming).to eq [a]
    end
  end
end
