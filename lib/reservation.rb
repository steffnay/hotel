require 'date'
require 'pry'
require 'awesome_print'

module Hotel
  class Reservation

    attr_reader :id, :room, :start_date, :end_date

    def initialize(id, room, start_date, end_date)
      @id = id
      @room = room
      @start_date = DateTime.parse(start_date)
      @end_date = DateTime.parse(end_date)

      make_new
    end

    def make_new
      reservation = [@id, @room, @start_date, @end_date]
    end

    def self.get_by_date(date)
      date = DateTime.parse(date)

      all_reservations = self.all
      all_instances = []

      all_reservations.each do |reservation|
        beginning = reservation.start_date
        ending = reservation.end_date

        date_range = (beginning..ending)
          if date_range.cover?(date)
            all_instances << reservation
          end
      end
      return all_instances
    end

    def self.all
        ObjectSpace.each_object(self).to_a
      end
  end
end

new_reservation = Hotel::Reservation.new(100, 5,"2020-02-24", "2020-02-28")
new_reservation2 = Hotel::Reservation.new(200, 3,"2020-02-23", "2020-02-26")

# reservation_list = Hotel::Reservation.get_by_date("2020-02-25")

ap Hotel::Reservation.all
