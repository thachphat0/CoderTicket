require 'rails_helper'

RSpec.describe "Events", type: :request do
  describe "GET /events" do
    it "accepts search on the homepage" do
      FactoryGirl.create(:event, starts_at: 2.days.ago, ends_at: 1.day.ago, name: "Dam Vinh Hung's concert")
      FactoryGirl.create(:event, starts_at: 2.days.ago, ends_at: 1.day.from_now, name: 'Scorpion in Vietnam')

      get root_path(search: "Scorpion")
      expect(response).to have_http_status(200)
      expect(response.body).to include "Scorpion in Vietnam"
      expect(response.body).to_not include "Dam Vinh Hung"
    end

    it 'routes /?search= to events#index' do
      FactoryGirl.create(:event, starts_at: 2.days.ago, ends_at: 1.day.from_now, name: 'Scorpion in Vietnam')

      get root_path(search: "Scorpion")
      expect(response).to have_http_status(200)
      expect(response.body).to include "Scorpion in Vietnam"

      get root_path(search: "new event")
      expect(response).to have_http_status(200)
      expect(response.body).to_not include "Scorpion in Vietnam"      
    end
  end
end
