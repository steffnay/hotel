require_relative '../lib/reservation.rb'
require 'awesome_print'
require 'pry'

module Hotel
  class Room
    attr_reader :room_number, :price, :reservations, :array
    attr_accessor :reservation_info

    @@array = []

    def self.update_room(room_number, reservation)
      reservation_info = @@array.select {|num| num[:room] == room_number}
      reservation_info[0][:reservations] << reservation
    end

    def initialize(number)
      @room_number = number
      @price = 200
      @reservations = []

      @@array << {room: @room_number, price: @price, reservations: @reservations}

      return @room_number
    end

    

  end
end
#
# something = Hotel::Room.new(600)
# ap something.add_new(600, "2020-02-24", "2020-02-28")
