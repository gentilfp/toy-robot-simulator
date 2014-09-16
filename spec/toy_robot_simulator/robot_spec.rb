require 'spec_helper'

describe ToyRobotSimulator::Robot do
  let(:robot) { described_class.new }

  describe "#place" do
    context "when placed to a valid place onto tabletop" do
      subject { robot.place(0, 0, "NORTH") }

      it "places robot assigning its position" do
        expect(subject.x).to eq 0
        expect(subject.y).to eq 0
        expect(subject.facing).to eq "NORTH"
      end
    end

    context "when placed to an invalid place onto tabletop" do
      context "when position is not integer" do
        it "raises PositionNotInteger" do
          expect{ robot.place("a", 0, "NORTH") }.to raise_error("PositionIsNotInteger")
        end
      end

      context "when facing is not allowed" do
        it "raises FacingNotAllowed" do
          expect{ robot.place(0, 0, "NORTE") }.to raise_error("FacingNotAllowed")
        end
      end
    end
  end

  describe "#move" do
  end

  describe "#turn" do
  end

  describe "#report" do
  end

  describe "#placed?" do
    context "when not placed into a tabletop" do
      it "returns false" do
        expect(robot.placed?).to eq false
      end
    end

    context "when placed into a tabletop" do
      subject { robot.place(0, 0, "NORTH") }
      it "returns true" do
        expect(subject.placed?).to eq true
      end
    end
  end
end
