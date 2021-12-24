# frozen_string_literal: true

class TicketPayment
  
  NotEnoughTicketsError = Class.new(StandardError)

  def self.call(ticket, payment_token, tickets_count)
    available_tickets = ticket.available
    raise NotEnoughTicketsError, "Not enough tickets left." unless available_tickets >= tickets_count
    unless ticket.update(available: available_tickets - tickets_count)
      return ticket.errors[:base]
    end
    PaymentWorker.perform_at(15.minutes.from_now, ticket.id, tickets_count, payment_token)    
  end
end
