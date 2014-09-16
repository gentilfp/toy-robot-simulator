require 'spec_helper'

describe ToyRobotSimulator::Movement do
  describe "allowed_facing?" do
    let(:allowed_facing?) { ToyRobotSimulator::Movement.allowed_facing?(facing) }

    context "when facing is allowed" do
      context "NORTH" do
        let(:facing) { "NORTH" }

        it "returns true" do
          expect(allowed_facing?).to eq true
        end
      end

      context "SOUTH" do
        let(:facing) { "SOUTH" }

        it "returns true" do
          expect(allowed_facing?).to eq true
        end
      end

      context "EAST" do
        let(:facing) { "EAST" }

        it "returns true" do
          expect(allowed_facing?).to eq true
        end
      end

      context "WEST" do
        let(:facing) { "WEST" }

        it "returns true" do
          expect(allowed_facing?).to eq true
        end
      end
    end

    context "when facing is not allowed" do
      context "when its nil?" do
        let(:facing) { nil }

        it "returns false" do
          expect(allowed_facing?).to eq false
        end
      end

      context "when its invalid" do
        let(:facing) { "NORTE" }

        it "returns false" do
          expect(allowed_facing?).to eq false
        end
      end
    end
  end

  describe "allowed_movement?" do
    let(:allowed_movement?) { ToyRobotSimulator::Movement.allowed_movement?(movement) }

    context "when movement is allowed" do
      context "FOWARD" do
        let(:movement) { "FOWARD" }

        it "returns true" do
          expect(allowed_movement?).to eq true
        end
      end
    end

    context "when movement is not allowed" do
      context "when its nil" do
        let(:movement) { nil }

        it "returns false" do
          expect(allowed_movement?).to eq false
        end
      end

      context "when its invalid" do
        let(:movement) { "BACKWARD" }

        it "returns false" do
          expect(allowed_movement?).to eq false
        end
      end
    end
  end
end
