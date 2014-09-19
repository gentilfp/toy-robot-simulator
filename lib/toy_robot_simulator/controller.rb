module ToyRobotSimulator
  class Controller

    attr_accessor :robot, :tabletop

    def initialize(width = nil, height = nil)
      @robot = Robot.new
      @tabletop = Tabletop.new(width, height)
    end

    def place(x, y, facing)
    end

    def move
    end

    def turn turn_command
    end
  end
end
