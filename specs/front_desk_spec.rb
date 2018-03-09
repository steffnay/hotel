require_relative 'spec_helper'

describe "Front Desk class" do

  describe "instantiation" do
    it "creates a new front desk" do
      desk = Hotel::FrontDesk.new
      desk.must_be_kind_of Hotel::FrontDesk
    end

    it "loads all rooms" do
      desk = Hotel::FrontDesk.new
      desk.all_rooms.must_be_kind_of Array
      desk.all_rooms.length.must_equal 20
    end
  end

  describe "list rooms" do
    it "lists all the rooms in hotel" do
      desk = Hotel::FrontDesk.new
      desk.list.must_include 2
    end
  end

  describe "all reservations" do
    it "returns an array of all current reservations" do
      desk = Hotel::FrontDesk.new
      desk.all_reservations.must_be_kind_of Array
    end
  end

  describe "reserve_room" do
    it "creates a new reservation" do
      desk = Hotel::FrontDesk.new
      new_reservation = desk.reserve_room(1, "2020-04-24", "2020-04-28")
      new_reservation.must_be_kind_of Hotel::Reservation
      new_reservation.room.must_equal 1
      new_reservation.id.must_be_kind_of Integer
    end

    it "raises an exception if try to reserve unavailable room" do
      desk = Hotel::FrontDesk.new
      new_reservation = desk.reserve_room(1, "2020-05-24", "2020-05-28")
      proc { desk.reserve_room(1, "2020-05-27", "2020-05-30") }.must_raise StandardError
    end
  end

  describe "total" do
    it "calculates total cost of reservation" do
      desk = Hotel::FrontDesk.new
      new_reservation = desk.reserve_room(1, "2020-03-21", "2020-03-24")
      lookup = new_reservation.id
      desk.total(lookup).must_equal 600.00
    end
  end

  describe "open rooms" do
    it "returns a list of rooms not reserved between date range" do
      desk = Hotel::FrontDesk.new
      new_reservation = desk.reserve_room(14, "2020-01-14", "2020-01-17")
      new_reservation2 = desk.reserve_room(3, "2020-01-02", "2020-01-08")
      new_reservation3 = desk.reserve_room(13, "2020-01-04", "2020-01-07")

      available = desk.open_rooms("2020-01-07", "2020-01-15")
      available.wont_include 14
      available.wont_include 3
      available.must_include 13
    end
  end

  describe "reserve block" do
    it "creates a new block reservation" do
      desk = Hotel::FrontDesk.new
      blockhead = desk.block_reservation(4, "2040-01-20", "2040-01-26")
      blockhead.must_be_kind_of Hotel::BlockReservation
      blockhead.block_id.must_be_kind_of Integer
    end

    it "makes rooms in block unavailable to public" do
      desk = Hotel::FrontDesk.new
      blockhead = desk.block_reservation(4, "2040-02-20", "2040-02-26")
      blockhead.must_be_kind_of Hotel::BlockReservation

      proc { desk.reserve_room(1, "2040-02-22", "2040-02-26") }.must_raise StandardError
    end

    it "raises exception of there aren't enough open rooms" do
      desk = Hotel::FrontDesk.new
      i = 1
      17.times do
        desk.reserve_room(i, "2041-02-20", "2041-02-26")
        i += 1
      end
      proc { desk.block_reservation(4, "2041-02-20", "2041-02-26") }.must_raise StandardError
    end

    it "creates list of rooms that block has reserved" do
      desk = Hotel::FrontDesk.new
      blockhead = desk.block_reservation(1, "2050-02-20", "2050-02-26")
      blockhead.available_rooms.must_be_kind_of Array
    end
  end

  describe "reserve block room" do
    it "reserves a room within a block" do
      steffany = Hotel::FrontDesk.new
      i = 1
      17.times do
        steffany.reserve_room(i, "2018-03-07", "2018-03-20")
        i += 1
      end
      blocker = steffany.block_reservation(2, "2018-03-07", "2018-03-20")
      rm_num = blocker.available_rooms[0]
      okay_res = steffany.reserve_block_room(11111, rm_num)
      okay_res.must_be_kind_of Hotel::Reservation
      proc { steffany.reserve_room(blocker.available_rooms[1], "2018-03-12", "2018-03-18")}.must_raise StandardError
    end

    it "raises an exception if block doesn't exist" do
      proc { steffany.reserve_block_room(900000, 20)}.must_raise StandardError
    end

    describe "get by date" do
      it "returns all reservations w/in a certain date range" do
        admin = Hotel::FrontDesk.new
        new_reservation = admin.reserve_room(5,"2020-02-24", "2020-02-28")

        reservation_list = admin.get_by_date("2020-02-26")
        reservation_list.must_include new_reservation
      end
    end
  end
end
