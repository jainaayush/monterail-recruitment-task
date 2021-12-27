# frozen_string_literal: true

class Ticket < ApplicationRecord
  belongs_to :event
  validates :available, numericality: { even: true }
  validate :check_available

  private

  def check_available
    if ! (available > 1)
      self.errors[:available] << "Ticket count should be available atleast one"
    end
  end
end
