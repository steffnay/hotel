module Hotel
  class Room
    attr_reader :room_number, :price, :reservations

    @@array = []

    def initialize(number)
      @room_number = number
      @price = 200
      @reservations = []

    @@array << {room: @room_number, price: @price, reservations: @reservations}

     return @room_number
    end
  end
end
