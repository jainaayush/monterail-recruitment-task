# frozen_string_literal: true

json.events do
  json.array! @events, :id, :name, :time
end
