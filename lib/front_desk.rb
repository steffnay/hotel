require_relative '../lib/room.rb'
require_relative '../lib/reservation.rb'
require_relative '../lib/block_reservation.rb'
require "awesome_print"

module Hotel
  class FrontDesk

  attr_reader :all_rooms, :all_reservations

    def initialize
      @all_rooms = load_rooms
      @all_reservations = []

      load_rooms
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
      @room_array
    end


    def reserve_room(room_number, start_date, end_date, block_id = 0)
      room_list = open_rooms(start_date, end_date)

      unless room_list.include?(room_number) || block_id != 0
        raise StandardError
      end

      newby = Hotel::Reservation.new(room_number, start_date, end_date, block_id)
      Hotel::Room.update_room(room_number, newby)
      @all_reservations.push(newby)

      return newby
    end


    def all_res
     return @all_reservations
    end


    def total(id)
      found = @all_reservations.detect {|reservation| reservation.id == id}

      length = found.end_date - found. start_date
      total = length * 200.00
      return total
    end


    def get_by_date(date)
      date = DateTime.parse(date)

      all_instances = []

      @all_reservations.each do |reservation|
        beginning = reservation.start_date
        ending = reservation.end_date
        date_range = (beginning..ending)

        if date_range.cover?(date)
          all_instances << reservation
        end
      end
      return all_instances
    end


    def open_rooms(start_date, end_date)
      sd = DateTime.parse(start_date)
      ed = DateTime.parse(end_date)

      open = []

      @all_reservations.each do |res|
        if sd <= (res.end_date - 1) && res.start_date <= ed
          number = res.room
          @all_rooms.delete_if {|room| room.room_number == number}
        end
      end
      @all_rooms.each do |rm|
        open << rm.room_number
      end

      return open
    end


    def block_reservation(num_of_rooms, start_date, end_date)
      options = open_rooms(start_date, end_date)
      if num_of_rooms > options.length || num_of_rooms > 5
        raise StandardError
      else
        selected_rooms = options[0...num_of_rooms]
        selected_rooms.each do |room|
          reserve_room(room, start_date, end_date)
        end
        blocky = Hotel::BlockReservation.new(num_of_rooms, selected_rooms, start_date, end_date)
      end

      return blocky
    end


    def reserve_block_room(block_id, room_number)
      blockitt = Hotel::BlockReservation.find(block_id)

      start_date = blockitt.start_date
      end_date = blockitt.end_date

      if blockitt.available_rooms.include?(room_number)
        new_res = reserve_room(room_number, start_date, end_date, block_id)
      end

      return new_res
    end

  end
end
#
# checking
# steffany = Hotel::FrontDesk.new
# i = 1
# 17.times do
#   steffany.reserve_room(i, "2018-03-07", "2018-03-20")
#   i += 1
# end
#
# steffany.block_reservation(2, "2018-03-07", "2018-03-20")
# steffany.reserve_room(20, "2018-03-12", "2018-03-18")
# ap steffany.reserve_block_room(11111, 20)
