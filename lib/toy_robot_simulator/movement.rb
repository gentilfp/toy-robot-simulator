module ToyRobotSimulator
  class Movement
    ALLOWED_FACINGS   = [:north, :south, :east, :west]
    ALLOWED_MOVEMENTS = [:foward]
    ALLOWED_TURN      = [:left, :right]

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
    end
  end
end
