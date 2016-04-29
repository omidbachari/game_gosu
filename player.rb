require 'gosu'
require_relative 'bullet'
class Player
  attr_accessor :bullet, :x, :y, :go_right, :go_left, :running_right, :running_left, :direction, :height, :shoot_ready, :bullets, :x3

  def initialize(window)
    @window = window
    @player = Gosu::Image.new(@window, "images/player_right/player1.png")
    @player_stop_right = Gosu::Image.new(@window, "images/player_right/player1.png")
    @player_run_right = [Gosu::Image.new(@window, "images/player_right/player2.png"),
      Gosu::Image.new(@window, "images/player_right/player3.png"),
      Gosu::Image.new(@window, "images/player_right/player4.png"),
      Gosu::Image.new(@window, "images/player_right/player5.png"),
      Gosu::Image.new(@window, "images/player_right/player6.png")]
    @player_stop_left = Gosu::Image.new(@window, "images/player_left/player1.png")
    @player_run_left = [Gosu::Image.new(@window, "images/player_left/player2.png"),
      Gosu::Image.new(@window, "images/player_left/player3.png"),
      Gosu::Image.new(@window, "images/player_left/player4.png"),
      Gosu::Image.new(@window, "images/player_left/player5.png"),
      Gosu::Image.new(@window, "images/player_left/player6.png")]
    @x = 100
    @y = 650 - @player.height
    @running_right = false
    @running_left = false
    @direction = 1
    @bullets = []
    @falling = false
    @grav_accel = 0
  end

  def update
    if @bullets.count > 0
      @bullets.each do |bullet|
        bullet.update
      end
    end

    if @y < (650 - @player.height)
      @falling = true
      @grav_accel += 2
      @y = @grav_accel
    end
  end

  def draw
    if @direction == 1
      if @running_right == false
        @player_stop_right.draw(@x, @y, 10)
      else @running_right == true
        img = @player_run_right[(Gosu::milliseconds / 60) % @player_run_right.size]
        img.draw(@x, @y, 10)
      end
    else
      if @running_left == false
        @player_stop_left.draw(@x, @y, 10)
      else @running_left == true
        img1 = @player_run_left[(Gosu::milliseconds / 60) % @player_run_left.size]
        img1.draw(@x, @y, 10)
      end
    end
    if @bullets.count > 0
      @bullets.each do |bullet|
        bullet.draw
      end
    end
  end

  def shoot_ready
    @direction == 1 && @running_left == false && @running_right == false
  end

  def shoot
    @bullets << Bullet.new(self, @window, self.x, self.y, self.direction)
  end

  def jump
    if @falling == false && @y == (650 - @player.height)
      @falling = true
      @y -= 80
    end
  end

end
