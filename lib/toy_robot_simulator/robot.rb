module ToyRobotSimulator
  class Robot
    attr_accessor :x, :y, :facing

    def initialize
      @x = nil; @y = nil; @facing = nil
    end

    def place x, y, facing
      raise "PositionIsNotInteger" unless x.is_a?(Integer) && y.is_a?(Integer)
      raise "FacingNotAllowed" unless ToyRobotSimulator::Movement.allowed_facing?(facing)

      @x = x; @y = y; @facing = facing
      self
    end

    def move
    end

    def turn
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
