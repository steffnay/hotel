module Hotel
  class Reservation

    attr_reader :room
    
    def initialize(room, start_date, end_date)
      @room = room
      @start_date = start_date
      @end_date = end_date

      make_new
    end

    def make_new
      reservation = [@room, @start_date, @end_date]
    end
  end
end
