require 'spec_helper'

describe ToyRobotSimulator::Simulator do
  describe "#initialize" do
    let(:simulator) { ToyRobotSimulator::Simulator }

    it 'puts welcome message when it starts' do
      allow($stdin).to receive(:gets).and_return(false)
      expect_any_instance_of(simulator).to receive(:welcome_message).and_call_original
      simulator.new
    end

    it 'ends when user type QUIT' do
      allow_any_instance_of(simulator).to receive(:welcome_message).and_call_original
      allow($stdin).to receive(:gets).and_return("QUIT")
      simulator.new
    end

    context "with invalid command" do
      it "ignores completely command" do
        allow_any_instance_of(simulator).to receive(:welcome_message).and_call_original
        expect($stdin).to receive(:gets).and_return("ABC")
        expect($stdin).to receive(:gets).and_return("QUIT")
        simulator.new
      end
    end

    context "with valid command" do
      it "keeps receiving command until its done" do
        allow_any_instance_of(simulator).to receive(:welcome_message).and_call_original
        expect($stdin).to receive(:gets).and_return("PLACE 0,0,NORTH")
        expect($stdin).to receive(:gets).and_return("MOVE")
        expect($stdin).to receive(:gets).and_return("MOVE")
        expect($stdin).to receive(:gets).and_return("QUIT")
        simulator.new
      end
    end
  end
end
