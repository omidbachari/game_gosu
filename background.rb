class Background
attr_accessor :x, :x2, :y1
  def initialize(window)
    @window = window
    @bg_a = Gosu::Image.new(window, "images/sky.jpg")
    @x = 0
    @y = -100
    @y1 = 650
    @bg_b = Gosu::Image.new(window, "images/mountain.png")
    @bg_c = Gosu::Image.new(window, "images/grass.png")
    @x1 = 0
    @x2 = 0
  end

  def update
    if @x < -@bg_c.width
      @x = 0
    end

    if @x2 < -@bg_b.width
      @x2 = -@bg_b.width
    end

    @x1 = 100 * Math.sin(0.8 * Time.now.to_f) - 100
    # y = a sin b x + c
    # a def. affects amplitude
    # b def. affects frequency
    # c def. affects origin

  end

  def draw

    @bg_a.draw(@x1, @y, 0)
    @bg_b.draw(@x2, -300, 1)
    @bg_c.draw(@x,@y1,3)

    @bg_c.draw(@x + @bg_c.width, 650, 3)

  end
end
