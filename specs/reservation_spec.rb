require_relative 'spec_helper'

describe "Reservation class" do

  describe "reservation instantiation" do

    it "creates a new reservation" do
      new_reservation = Hotel::Reservation.new(3,2020-02-24, 2020-02-28)
      new_reservation.must_be_kind_of Hotel::Reservation
    end
  end

  describe "make new" do
    it "creates a new reservation" do
      new_reservation = Hotel::Reservation.new(5,2020-02-24, 2020-02-28)
      output = new_reservation.make_new
      output.must_be_kind_of Array

    end
  end
end
