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
    context "when robot is placed" do
      let(:pos_x) { 0 }
      let(:pos_y) { 0 }
      let(:facing) { "NORTH" }
      subject { robot.place(pos_x, pos_y, facing) }

      it "shows its current position" do
        expect(subject.report).to eq "#{pos_x}, #{pos_y}, #{facing}"
      end
    end

    context "when robot is not placed" do
      it "raises NotPlacedRobot" do
        expect{ robot.report }.to raise_error("NotPlacedRobot")
      end
    end
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
