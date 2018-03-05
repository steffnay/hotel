require_relative 'spec_helper'

describe "Reservation class" do

  describe "reservation instantiation" do

    it "creates a new reservation" do
      new_reservation = Hotel::Reservation.new
      new_reservation.must_be_kind_of Hotel::Reservation
    end
  end
end
