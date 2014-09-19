require 'spec_helper'

describe ToyRobotSimulator::Tabletop do
  let(:tabletop) { ToyRobotSimulator::Tabletop }

  describe "initialize" do
    subject { tabletop.new(width, height) }

    context "with default parameters" do
      let(:width)  { nil }
      let(:height) { nil }

      it "creates a tabletop 5x5" do
        expect(subject.width).to eq 5
        expect(subject.height).to eq 5
      end
    end

    context "with custom X,Y parameters" do
      let(:width)  { 10 }
      let(:height) { 10 }

      it "creates a X,Y (widthxheight) tabletop" do
        expect(subject.width).to eq 10
        expect(subject.height).to eq 10
      end
    end
  end

  describe "initialized?" do
    subject { tabletop.new }

    context "when initialized" do
      it "returns true" do
        expect(subject.initialized?).to eq true
      end
    end
  end

  describe "allowed_movement?" do
    subject { tabletop.new }

    it "returns true when going to a valid position on tabletop" do
      expect(subject.allowed_movement?(0, 0, "NORTH")).to be true
    end

    it "returns false when going to invalid position on tabletop" do
      expect(subject.allowed_movement?(0, 0, "WEST")).to be false
    end
  end

  describe "allowed_position?" do
    subject { tabletop.new }

    it "returns true when going to a valid position on tabletop" do
      expect(subject.allowed_position?(2, 3)).to be true
    end

    context "when going to a not valid position on tabletop" do
      it "returns false with X valid and Y invalid" do
        expect(subject.allowed_position?(-1, 3)).to be false
      end

      it "returns false with X invalid and Y valid" do
        expect(subject.allowed_position?(2, 10)).to be false
      end
    end
  end
end
