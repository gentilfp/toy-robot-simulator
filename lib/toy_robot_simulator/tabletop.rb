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

    def allowed_position?(x, y)
      allowed_x?(x) && allowed_y?(y)
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
