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
  end

  describe "#move" do
  end

  describe "#turn" do
  end

end
