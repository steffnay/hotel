require_relative 'spec_helper'

describe "Reservation class" do

  describe "reservation instantiation" do

    it "creates a new reservation" do
      new_reservation = Hotel::Reservation.new(3,"2020-02-24", "2020-02-28")
      new_reservation.must_be_kind_of Hotel::Reservation
    end

    it "raises an error if invalid date range" do
      proc { Hotel::Reservation.new(3,"2020-02-22", "2020-02-20")}.must_raise StandardError
      proc { Hotel::Reservation.new(3,"2020-02-24", "2020-02-24") }.must_raise StandardError
    end
  end

end
