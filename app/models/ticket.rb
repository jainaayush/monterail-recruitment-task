# frozen_string_literal: true

class Ticket < ApplicationRecord
  belongs_to :event
  validate :check_available

  private

  def check_available
    if ! (available > 1)
      self.errors[:base] << "Ticket count should be available atleast one"
    end
  end

end