require_relative '../lib/room.rb'
require_relative '../lib/reservation.rb'

module Hotel
  class FrontDesk

  attr_reader :all_rooms

    def initialize
      @all_rooms = load_rooms
    end

    def load_rooms
      @room_array = []

      20.times do |i|
        i+= 1
        room = Hotel::Room.new(i)
        @room_array << room
      end

      return @room_array
    end

    def list
      list = []
      @room_array.each do |room|
        number = "Room #{room.room_number}"
      list << number
      end

      return list
    end

    def all_reservations
     Hotel::Reservation.all
    end

    def reserve(room_number, start_date, end_date)
      Hotel::Reservation.new(room_number, start_date, end_date)
    end

    def retrieve_reservation(date)
      Hotel::Reservation.get_by_date(date)
    end
  end
end
