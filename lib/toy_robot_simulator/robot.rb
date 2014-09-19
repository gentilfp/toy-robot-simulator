module ToyRobotSimulator
  class Robot
    attr_accessor :x, :y, :facing

    def initialize
      @x = nil; @y = nil; @facing = nil
      self
    end

    def place x, y, facing
      raise "PositionIsNotInteger" unless x.is_a?(Integer) && y.is_a?(Integer)
      raise "FacingNotAllowed" unless Movement.allowed_facing?(facing)

      @x = x; @y = y; @facing = facing
      self
    end

    def move move
      raise "RobotNotPlaced" unless placed?
      raise "MoveCommandNotAllowed" unless Movement.allowed_movement?(move)

      self
    end

    def turn turn
      raise "RobotNotPlaced" unless placed?
      raise "TurnCommandNotAllowed" unless Movement.allowed_turn?(turn)

      @facing = Movement.turn(facing, turn)
      self
    end

    def report
      raise "NotPlacedRobot" unless placed?

      "#{x}, #{y}, #{facing}"
    end

    def placed?
      !(@x.nil? || @y.nil? || @facing.nil?)
    end
  end
end
