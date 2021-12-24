class PaymentWorker
  include Sidekiq::Worker
  
  def perform(ticket_id, tickets_count, payment_token)
    ticket = Ticket.find_by_id(ticket_id)
    res = Payment::Gateway.charge(amount: ticket.price, token: payment_token, currency: "EUR")
    unless res.amount.present?
      available_tickets = ticket.available
      ticket.update(available: available_tickets + tickets_count)
    end  
  end  
end