require 'spec_helper'

describe ToyRobotSimulator::Simulator do
  describe "#initialize" do
    let(:simulator) { ToyRobotSimulator::Simulator }

    it 'puts welcome message when it starts' do
      allow($stdin).to receive(:gets).and_return(false)
      expect_any_instance_of(simulator).to receive(:welcome_message)
      simulator.new
    end

    it 'ends when user type QUIT' do
      allow_any_instance_of(simulator).to receive(:welcome_message)
      allow($stdin).to receive(:gets).and_return("QUIT")
      simulator.new
    end
  end
end
