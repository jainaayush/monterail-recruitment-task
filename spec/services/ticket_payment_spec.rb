# frozen_string_literal: true

require "rails_helper"

RSpec.describe TicketPayment do
  describe ".call" do
    subject { described_class.call(ticket, token, tickets_count) }

    let(:ticket) { create(:ticket) }
    let(:token) { "token" }


    context "when tickets are available" do
      let(:tickets_count) { 1 }

      it "should update available tickets count" do
        expect { subject }.to change(ticket, :available).by(-1)
      end
    end

    context "when tickets are not available" do
      let(:tickets_count) { ticket.available + 1 }

      it "should raise error" do
        expect { subject }.to raise_error(TicketPayment::NotEnoughTicketsError)
      end
    end
  end
end
