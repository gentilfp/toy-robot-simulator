require 'spec_helper'

describe ToyRobotSimulator::Controller do
  describe "initialize" do
    let(:robot)      { ToyRobotSimulator::Robot.new }
    let(:tabletop)   { ToyRobotSimulator::Tabletop.new(width, height) }
    let(:controller) { described_class.new(width, height) }

    context "with custom width and height" do
      let(:width)  { 10 }
      let(:height) { 10 }

      it "matches robot" do
        expect(controller.robot.x).to eq robot.x
        expect(controller.robot.y).to eq robot.y
        expect(controller.robot.facing).to eq robot.facing
      end

      it "matches tabletop" do
        expect(controller.tabletop.width).to eq tabletop.width
        expect(controller.tabletop.height).to eq tabletop.height
      end
    end

    context "with default width and height" do
      let(:width)  { nil }
      let(:height) { nil }

      it "matches robot" do
        expect(controller.robot.x).to eq robot.x
        expect(controller.robot.y).to eq robot.y
        expect(controller.robot.facing).to eq robot.facing
      end

      it "matches tabletop" do
        expect(controller.tabletop.width).to eq tabletop.width
        expect(controller.tabletop.height).to eq tabletop.height
      end
    end
  end

  describe "#place" do
    let(:controller) { (described_class.new) }
    let!(:place)  { controller.place(x, y, facing) }

    context "when position is out of bound" do
      let(:x)      { 0 }
      let(:y)      { 10 }
      let(:facing) { "NORTH" }

      it "does not place robot" do
        expect(controller.robot.x).to be_nil
        expect(controller.robot.y).to be_nil
        expect(controller.robot.facing).to be_nil
      end
    end

    context "when placing is allowed" do
      let(:x)      { 0 }
      let(:y)      { 1 }
      let(:facing) { "NORTH" }

      it "places robot in a specific position" do
        expect(controller.robot.x).to eq x
        expect(controller.robot.y).to eq y
        expect(controller.robot.facing).to eq facing
      end
    end

    context "when placing is not allowed" do
      let(:x)      { "a" }
      let(:y)      { 1 }
      let(:facing) { "NORTH" }

      context "and facing is not integer" do
        it "does not placed robot" do
          expect(controller.robot.x).to be_nil
          expect(controller.robot.y).to be_nil
          expect(controller.robot.facing).to be_nil
        end
      end

      context "and facing is not allowed" do
        let(:x)      { 0 }
        let(:y)      { 1 }
        let(:facing) { "ABC" }

        it "does not place robot" do
          expect(controller.robot.x).to be_nil
          expect(controller.robot.y).to be_nil
          expect(controller.robot.facing).to be_nil
        end
      end
    end
  end

  describe "#move" do
  end

  describe "#turn" do
    let(:controller) { (described_class.new) }
    let!(:turn) { controller.turn(command) }

    context "when robot is not placed" do
      let(:command) { nil }

      it "does not turn robot" do
        expect(controller.robot.x).to be_nil
        expect(controller.robot.y).to be_nil
        expect(controller.robot.facing).to be_nil
      end
    end

    context "when robot is placed" do
      before :each do
        controller.place(0, 0, "NORTH")
      end

      context "and turn command is not allowed" do
        let(:command) { "DIREITA" }

        it "does not turn robot" do
          expect(controller.robot.facing).to eq "NORTH"
        end
      end

      context "and command is valid" do
        let(:command) { "RIGHT" }

        it "moves robot to specific facing" do
          expect(controller.robot.facing).to eq "EAST"
        end
      end
    end
  end

end
