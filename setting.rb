require 'gosu'
require_relative 'background'
require_relative 'player'
require_relative 'adam'

class Setting < Gosu::Window
  attr_accessor :adam, :bullet

  def initialize
    super(900, 700, false)
    self.caption = "Destroy Adam Lite BETA"
    @title = Gosu::Image.from_text(self, "DESTROY ADAM Lite BETA",
                                        Gosu.default_font_name, 20)
    @music1 = Gosu::Song.new("sound/contra.mp3")
    @music1.play(looping = true)
    @music1.volume = 0.8
    @shoot = Gosu::Sample.new("sound/shot.mp3")
    @bullet = Gosu::Image.new(self, "images/bullet.png")
    @background = Background.new(self)
    @player = Player.new(self)
    @run = []
    @x1 = self.width - @title.width
    @y1 = self.height - @title.height
    @adam = Gosu::Image.new(self, "images/adam-head.png")
  end

  def button_down(id)
    close if id == Gosu::KbEscape
    if id == Gosu::KbSpace
      @player.shoot
      @shoot.play
    end
    if id == Gosu::KbUp
      @player.jump
    end
  end

  def update
    @player.running_left = false
    @player.running_right = false

    if button_down?(Gosu::KbRight)
      @background.x -= 3
    end

    if button_down?(Gosu::KbRight)
      @background.x2 -= 0.25
    end

    if button_down?(Gosu::KbRight)
      @player.direction = 1
      @player.running_right = true
    end

    if button_down?(Gosu::KbRight) && @player.x < 800
      @player.x += 3
    end

    if button_down?(Gosu::KbLeft) && @player.x > 100
      @player.direction = 0
      @player.running_left = true
    end


    if button_down?(Gosu::KbLeft) && @player.x > 100
      @player.x -= 3
    end


    @player.bullets.reject! do |bullet|
      bullet.x > 900 || bullet.x < 0
    end

    @player.update
    @background.update
  end

  def draw
    @title.draw(@x1, @y1, 5)
    @background.draw
    @player.draw
    # @adam.draw
  end

end

setting = Setting.new
setting.show
