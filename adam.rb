require 'gosu'

class Adam
  attr_accessor :draw

  def initialize(window)
    @window = window

    @x = 500
    @y = 650 - self.height
    @adams = []
  end


  def draw
    @window.adam.draw(@x, @y, 10)
  end

  def adam_destroyed
    @bullet
  end

  def spawn

  end

end
