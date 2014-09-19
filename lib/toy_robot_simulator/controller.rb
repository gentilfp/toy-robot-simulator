module ToyRobotSimulator
  class Controller

    attr_accessor :robot, :tabletop

    def initialize(width = nil, height = nil)
      @robot = Robot.new
      @tabletop = Tabletop.new(width, height)
    end

    def place(x, y, facing)
      begin
        if tabletop.allowed_position?(x, y)
          robot.place(x, y, facing)
        else
          puts tabletop.invalid_position_message
        end
      rescue Exceptions::PositionIsNotInteger => e
        puts e.message
      rescue Exceptions::FacingNotAllowed => e
        puts e.message
      end
    end

    def move
    end

    def turn turn_command
    end
  end
end
