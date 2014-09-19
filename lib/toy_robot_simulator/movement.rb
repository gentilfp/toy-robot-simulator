module ToyRobotSimulator
  class Movement
    ALLOWED_FACINGS   = [:north, :south, :east, :west]
    ALLOWED_MOVEMENTS = [:foward]
    ALLOWED_TURN      = [:left, :right]

    attr_accessor :turn_command

    class << self
      def allowed_facing? facing
        return false if facing.nil?
        ALLOWED_FACINGS.include?(facing.downcase.to_sym)
      end

      def allowed_movement? movement
        return false if movement.nil?
        ALLOWED_MOVEMENTS.include?(movement.downcase.to_sym)
      end

      def allowed_turn? turn
        return false if turn.nil?
        ALLOWED_TURN.include?(turn.downcase.to_sym)
      end

      def move current_x, current_y, current_facing
        new_x, new_y = case current_facing.downcase.to_sym
        when :north, :south
          [ current_x, current_y + 1 ]
        when :west, :east
          [ current_x + 1, current_y ]
        end
        [ new_x, new_y ]
      end

      def turn current_facing, turn_command
        @turn_command = turn_command
        new_facing = case current_facing.downcase.to_sym
        when :north
          turn_north
        when :south
          turn_south
        when :east
          turn_east
        when :west
          turn_west
        end
        new_facing.upcase.to_s
      end

      private
      def turn_command
        @turn_command
      end

      def left?
        turn_command.downcase.to_sym == :left
      end

      def turn_north
        left? ? :west : :east
      end

      def turn_south
        left? ? :east : :west
      end

      def turn_east
        left? ? :north : :south
      end

      def turn_west
        left? ? :south : :north
      end
    end
  end
end
