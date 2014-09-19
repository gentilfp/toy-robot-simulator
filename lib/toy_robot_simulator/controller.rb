module ToyRobotSimulator
  class Controller

    attr_accessor :robot, :tabletop

    def initialize(width = nil, height = nil)
      @robot = Robot.new
      @tabletop = Tabletop.new(width, height)
    end

    def place(x, y, facing)
      x = integer! x
      y = integer! y
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

    def move move: nil
      begin
        if tabletop.allowed_movement?(robot.x, robot.y, robot.facing)
          robot.move(move)
        else
          puts tabletop.invalid_position_message
        end
      rescue Exceptions::RobotNotPlaced => e
        puts e.message
      rescue Exceptions::MoveCommandNotAllowed => e
        puts e.message
      end
    end

    def left
      turn "left"
    end

    def right
      turn "right"
    end

    def turn turn_command
      begin
        robot.turn(turn_command)
      rescue Exceptions::RobotNotPlaced => e
        puts e.message
      rescue Exceptions::TurnCommandNotAllowed => e
        puts e.message
      end
    end

    def report
      puts robot.report
    end

    private
    def integer! number
      number.to_i.to_s == number.to_s ? number.to_i : nil
    end
  end
end
