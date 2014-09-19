module ToyRobotSimulator
  class Tabletop
    attr_accessor :width, :height

    DEFAULT_WIDTH = 5
    DEFAULT_HEIGHT = 5

    def initialize(width=nil, height=nil)
      @width = width || DEFAULT_WIDTH
      @height = height || DEFAULT_HEIGHT
    end

    def initialized?
      !(@width.nil? || @height.nil?)
    end

    def allowed_movement?(x, y, facing)
      x, y = Movement.move(x, y, facing)
      allowed_position?(x, y)
    end

    def allowed_position?(x, y)
      raise Exceptions::PositionIsNotInteger unless x.is_a?(Integer) && y.is_a?(Integer)

      allowed_x?(x.to_i) && allowed_y?(y.to_i)
    end

    def invalid_position_message
      "Position is not valid in this tabletop"
    end

    private
    def allowed_x? x
      x >= 0 && x < @width
    end

    def allowed_y? y
      y >= 0 && y < @height
    end
  end
end
