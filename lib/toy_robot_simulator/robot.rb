require 'toy_robot_simulator/exceptions'

module ToyRobotSimulator
  class Robot
    attr_accessor :x, :y, :facing

    DEFAULT_MOVEMENT = "FORWARD"

    def initialize
      @x = nil; @y = nil; @facing = nil
      self
    end

    def place x, y, facing
      raise Exceptions::PositionIsNotInteger unless x.is_a?(Integer) && y.is_a?(Integer)
      raise Exceptions::FacingNotAllowed unless Movement.allowed_facing?(facing)

      @x = x; @y = y; @facing = facing
      self
    end

    def move move
      move ||= DEFAULT_MOVEMENT
      raise Exceptions::RobotNotPlaced unless placed?
      raise Exceptions::MoveCommandNotAllowed unless Movement.allowed_movement?(move)

      @x, @y = Movement.move(@x, @y, @facing)
      self
    end

    def turn turn
      raise Exceptions::RobotNotPlaced unless placed?
      raise Exceptions::TurnCommandNotAllowed unless Movement.allowed_turn?(turn)

      @facing = Movement.turn(@facing, turn)
      self
    end

    def report
      raise Exceptions::RobotNotPlaced unless placed?

      "#{x}, #{y}, #{facing}"
    end

    def placed?
      !(@x.nil? || @y.nil? || @facing.nil?)
    end
  end
end
