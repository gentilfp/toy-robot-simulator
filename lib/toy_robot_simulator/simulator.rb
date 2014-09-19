module ToyRobotSimulator
  class Simulator
    attr_accessor :controller

    def initialize
      controller = Controller.new

      welcome_message
      while line = $stdin.gets do
        break if line.downcase.include? "quit"

        command, arguments = line.split(' ')

        command   = command.downcase.to_sym rescue nil
        arguments = arguments.split(',') rescue []

        if available_commands.include? command.upcase.to_s
          controller.send(command, *arguments)
        end
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
      ["PLACE", "MOVE", "LEFT", "RIGHT", "REPORT"].join(', ')
    end
  end
end
