module Exceptions
  class PositionIsNotInteger < StandardError
    def initialize
      super("Position is not Integer")
    end
  end

  class FacingNotAllowed < StandardError
    def initialize
      super("Facing is not allowed")
    end
  end

  class RobotNotPlaced < StandardError
    def initialize
      super("Robot is not placed onto tabletop")
    end
  end

  class MoveCommandNotAllowed < StandardError
    def initialize
      super("Move command is not allowed")
    end
  end

  class TurnCommandNotAllowed < StandardError
    def initialize
      super("Turn command is not allowed")
    end
  end

  class PositionCannotBeBlank < StandardError
    def initialize
      super("X, Y or Facing cannot be blank")
    end
  end
end
