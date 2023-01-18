# frozen_string_literal: true

class Flight
  ATTRIBUTES = %i[id flight_number icao_company icao_departure_airport icao_arrival_airport
                  departure_time_utc arrival_time_utc].freeze

  attr_accessor(*ATTRIBUTES)

  def initialize(**args)
    ATTRIBUTES.each do |attribute|
      instance_variable_set("@#{attribute}", args[attribute])
    end
  end
end
