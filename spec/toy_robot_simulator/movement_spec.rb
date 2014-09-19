require 'spec_helper'

describe ToyRobotSimulator::Movement do
  describe "allowed_facing?" do
    let(:allowed_facing?) { described_class.allowed_facing?(facing) }

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

  describe ".allowed_movement?" do
    let(:allowed_movement?) { described_class.allowed_movement?(movement) }

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

  describe ".allowed_turn?" do
    let(:allowed_turn?) { described_class.allowed_turn?(turn) }

    context "when turn is allowed" do
      context "LEFT" do
        let(:turn) { "LEFT" }

        it "returns true" do
          expect(allowed_turn?).to eq true
        end
      end

      context "RIGHT" do
        let(:turn) { "RIGHT" }

        it "returns true" do
          expect(allowed_turn?).to eq true
        end
      end
    end

    context "when turn is not allowed" do
      context "when its nil" do
        let(:turn) { nil }

        it "returns false" do
          expect(allowed_turn?).to eq false
        end
      end

      context "when its invalid" do
        let(:turn) { "DIREITA" }

        it "returns false" do
          expect(allowed_turn?).to eq false
        end
      end
    end
  end

  describe ".turn" do
    subject { described_class.turn(facing, turn) }
    context "when facing NORTH" do
      let(:facing) { "NORTH" }

      context "and turning LEFT" do
        let(:turn) { "LEFT" }

        it "turns to WEAST" do
          expect(subject).to eq "WEST"
        end
      end

      context "and turning RIGHT" do
        let(:turn) { "RIGHT" }

        it "turns to EAST" do
          expect(subject).to eq "EAST"
        end
      end
    end

    context "when facing SOUTH" do
      let(:facing) { "SOUTH" }

      context "and turning LEFT" do
        let(:turn) { "LEFT" }

        it "turns to EAST" do
          expect(subject).to eq "EAST"
        end
      end

      context "and turning RIGHT" do
        let(:turn) { "RIGHT" }

        it "turns to WEST" do
          expect(subject).to eq "WEST"
        end
      end
    end

    context "when facing EAST" do
      let(:facing) { "EAST" }

      context "and turning LEFT" do
        let(:turn) { "LEFT" }

        it "turns to NORTH" do
          expect(subject).to eq "NORTH"
        end
      end

      context "and turning RIGHT" do
        let(:turn) { "RIGHT" }

        it "turns to SOUTH" do
          expect(subject).to eq "SOUTH"
        end
      end
    end

    context "when facing WEST" do
      let(:facing) { "WEST" }

      context "and turning LEFT" do
        let(:turn) { "LEFT" }

        it "turns to SOUTH" do
          expect(subject).to eq "SOUTH"
        end
      end

      context "and turning RIGHT" do
        let(:turn) { "RIGHT" }

        it "turns to NORTH" do
          expect(subject).to eq "NORTH"
        end
      end
    end
  end

end
