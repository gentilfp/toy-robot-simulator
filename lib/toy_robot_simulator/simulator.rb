module ToyRobotSimulator
  class Simulator
    attr_accessor :controller

    def initialize
      welcome_message
      while line = $stdin.gets do
        break if line.downcase.include? "quit"
        puts line
      end
    end

    def welcome_message
      puts %Q(
        This is the Toy Robot Simulator Code Challenge!\n
        Enter with #{available_commands}\n
        or type QUIT to end the simulator! Good game!\n
      )
    end

    def available_commands
      ["PLACE", "MOVE", "LEFT", "RIGHT"].join(', ')
    end
  end
end
