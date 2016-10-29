require 'rails_helper'

RSpec.describe "events", type: :routing do
  it "routes /upcoming to events#index" do
    expect(get: "/upcoming").to route_to(controller: "events", action: "index")
  end

  it 'routes /upcoming?search=new+event to events#index' do
    expect(get: "/upcoming?search=new+event").to route_to(controller: "events", action: "index")
  end

  it 'routes /events/event_id to events#show' do
  	expect(get: 'events/1').to route_to(controller: 'events', action: 'show')
  end
end