require_relative 'spec_helper'

describe "Reservation class" do

  describe "reservation instantiation" do

    it "creates a new reservation" do
      new_reservation = Hotel::Reservation.new(200, 3,"2020-02-24", "2020-02-28")
      new_reservation.must_be_kind_of Hotel::Reservation
      new_reservation.id.must_equal 200
    end
  end

  describe "make new" do
    it "creates a new reservation" do
      new_reservation = Hotel::Reservation.new(300, 5,"2020-02-24", "2020-02-28")
      output = new_reservation.make_new
      output.must_be_kind_of Array
    end
  end

  describe "get by date" do
    it "returns all reservations w/in a certain date range" do
      new_reservation = Hotel::Reservation.new(400, 5,"2020-02-24", "2020-02-28")
      reservation_list = Hotel::Reservation.get_by_date("2020-02-26")
      reservation_list.must_include new_reservation
    end
  end

  describe "find" do
    it "returns reservation with matching id" do
      new_reservation = Hotel::Reservation.new(444, 5,"2020-02-24", "2020-02-28")
      search = Hotel::Reservation.find(444)
      search.must_equal new_reservation
    end
  end
end
