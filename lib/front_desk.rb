require_relative '../lib/room.rb'

module Hotel
  class FrontDesk

  attr_reader :all_rooms

    def initialize
      @all_rooms = load_rooms
    end

    def load_rooms
      all_rooms = []

      20.times do |i|
        i+= 1
        room = Hotel::Room.new(i)
        all_rooms << room
      end

      return all_rooms
    end
  end
end
