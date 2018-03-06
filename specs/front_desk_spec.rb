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
      desk.list.must_include "Room 2"
    end
  end

  describe "reserve" do
    it "creates a new reservation" do
      desk = Hotel::FrontDesk.new
      new_reservation = desk.reserve(1, "2020-05-24", "2020-05-28")
      new_reservation.must_be_kind_of Hotel::Reservation
      new_reservation.room.must_equal 1
    end
  end

  describe "retrieve_reservation" do
    it "returns all reservations for given date" do
      desk = Hotel::FrontDesk.new
      new_reservation = desk.reserve(1, "2020-05-24", "2020-05-28")
      testing = desk.retrieve_reservation("2020-05-26")
      testing.must_include new_reservation
    end
  end
end
