require 'date'
require 'pry'
require 'awesome_print'

module Hotel
  class Reservation

    attr_reader :id, :room, :start_date, :end_date, :block_id

    @@number = 1

    def initialize(room, start_date, end_date, block_id = 0)

      @id = @@number
      @room = room
      @start_date = DateTime.parse(start_date)
      @end_date = DateTime.parse(end_date)
      @block_id = block_id
      @@number += 1

      check_date
    end

    def check_date
      unless @end_date > @start_date
        raise StandardError "INVALID DATE"
      end
    end

    # def self.get_by_date(date)
    #   date = DateTime.parse(date)
    #
    #   all_reservations = self.all
    #   all_instances = []
    #
    #   all_reservations.each do |reservation|
    #     beginning = reservation.start_date
    #     ending = reservation.end_date
    #
    #     date_range = (beginning..ending)
    #       if date_range.cover?(date)
    #         all_instances << reservation
    #       end
    #   end
    #   return all_instances
    # end


  end
end
