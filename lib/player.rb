class Player < Chingu::GameObject
  attr_accessor :last_x, :last_y, :direction
  
  def initialize(options = {})
    super
    @image = Image["tank.png"]
  end

  def move_left;  
    @x -= 1

  end
  
  def move_right 
    @x += 1
  end

  def move_up
    @y -= 1
  end

  def move_down
    @y += 1
  end

  def fire
    Bullet.create(:x => @x, :y => @y)
  end
end