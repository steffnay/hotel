require_relative '../lib/reservation.rb'
require 'awesome_print'
require 'pry'

module Hotel
  class Room
    attr_reader :room_number, :price, :reservations
    attr_accessor :reservation_info

    @@array = []

    def initialize(number)
      @room_number = number
      @price = 200
      @reservations = []

      @@array << {room: @room_number, price: @price, reservations: @reservations}

      return @room_number
    end

    def add_new(room, start_date, end_date)
      newby = Hotel::Reservation.new(room, start_date, end_date)

      reservation_info = @@array.select {|num| num[:room] == room}
      reservation_info[0][:reservations] << newby

    end
  end
end

something = Hotel::Room.new(600)
ap something.add_new(600, 2020-02-24, 2020-02-28)
