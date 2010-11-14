include Gosu
include Chingu

class Player < Chingu::GameObject
  trait :bounding_circle, :debug => false
  trait :collision_detection
  traits :timer

  attr_accessor :last_x, :last_y, :direction

  def initialize(options = {})
    super
    @image = Image["tank.png"]
    @angles = {:up => 0, :down => 180, :left => -90, :right => 90}
    @speed = 1
    @last_x, @last_y = @x, @y
    @direction = :top
  end

  def move(x,y = 0)
    @x += x
    @x = @last_x  if self.parent.viewport.outside_game_area?(self) || self.first_collision(Wall)

    @y += y
    @y = @last_y  if self.parent.viewport.outside_game_area?(self) || self.first_collision(Wall)

    self.angle = @angles[@direction]
    @last_x, @last_y = @x, @y
  end

  def move_left
    return if holding_any?(:up, :down)
    @direction = :left
    move -@speed
  end
  
  def move_right
    return if holding_any?(:up, :down)
    @direction = :right
    move @speed
  end

  def move_up
    @direction = :up
    move 0, -@speed
  end

  def move_down
    @direction = :down
    move 0, @speed
  end

  def fire
    Bullet.create(:x => @x, :y => @y, :direction => @direction)
    Sound['shoot.ogg'].play
  end


end