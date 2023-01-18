# frozen_string_literal: true

require './models/flight'

class Writer
  def initialize(strategy)
    @strategy = strategy
  end

  def write(instance)
    @strategy.write(instance)
  end
end

class WriteFormatter
  def initialize(filename)
    @file = File.open(filename, 'w')
  end

  def write(_instance)
    raise 'Not implemented'
  end
end

class InspectFormatter < WriteFormatter
  def write(instance)
    @file.puts(instance.inspect)
  end
end

flights = [
  Flight.new(id: 1, flight_number: 'G39182', icao_company: 'G3', icao_departure_airport: 'SBBR',
             icao_arrival_airport: 'SBSL', departure_time_utc: Time.now, arrival_time_utc: Time.now),
  Flight.new(id: 2, flight_number: 'LA3419', icao_company: 'LA', icao_departure_airport: 'SBBR',
             icao_arrival_airport: 'SBFZ', departure_time_utc: Time.now, arrival_time_utc: Time.now)
]

inspect_formatter = InspectFormatter.new('flights.txt')
inspect_writer = Writer.new(inspect_formatter)

flights.each { |flight| inspect_writer.write(flight) }
