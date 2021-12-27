# frozen_string_literal: true

require "rails_helper"

RSpec.describe Ticket, type: :model do
  describe "check_available" do
    let(:time) { DateTime.new(2020, 12, 31, 12) }
    let(:event) { create(:event, time: time) }

    it "is available should be even" do
      ticket = Ticket.create(event_id: event.id, available: 10)
      expect(ticket).to be_valid
    end

    it "is available should not be odd" do
      ticket = Ticket.create(event_id: event.id, available: 9)
      expect(ticket).to_not be_valid
    end

    it "is available should not be less than 2" do
      ticket = Ticket.create(event_id: event.id, available: 1)
      expect(ticket).to_not be_valid
    end
  end
end
