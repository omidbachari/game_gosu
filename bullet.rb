require 'gosu'
require_relative 'player'

class Bullet
attr_accessor :x, :y
  def initialize(player, window, x, y, direction)
    @player = player
    @window = window
    @x = x + 10
    @y = y + 10
    @direction = direction
  end

  def update
    if @direction == 1
      @x += 10
    else
      @x -= 10
    end
  end

  def draw
    @window.bullet.draw(@x, @y, 9)
  end




end
