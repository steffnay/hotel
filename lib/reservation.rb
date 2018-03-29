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

    def total
      length_of_stay = @end_date - @start_date
      reservation_total = length_of_stay * 200

      return reservation_total
    end
  end
end
