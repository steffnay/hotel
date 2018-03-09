require 'date'
require 'pry'
require 'awesome_print'

module Hotel
  class BlockReservation

    attr_reader :num_of_rooms, :start_date, :end_date, :block_id
    attr_accessor :available_rooms, :unavailable_rooms

    @@number = 11111

    def initialize(num_of_rooms, open_rooms, start_date, end_date)
      @block_id = @@number
      @num_of_rooms = num_of_rooms
      @start_date = start_date
      @end_date = end_date
      @available_rooms = open_rooms
      @unavailable_rooms = []


      @@number + 1
    end

    def self.all
      ObjectSpace.each_object(self).to_a
    end

    def self.find(id)
      blocks = self.all

      blocks.each do |number|
        if number.block_id == id
          return number
        end
      end

      raise StandardError "BLOCK NOT FOUND"
    end
  end
end
