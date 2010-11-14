class Bullet < Chingu::GameObject
  traits :bounding_circle, :collision_detection, :velocity, :timer
  
  def initialize(options)
    super(options.merge(:image => Image["bomb.png"]))
    @direction = options[:direction] || :up
    @angles = {:up => 90, :down => -90, :left => 0, :right => 180}
    self.angle = @angles[@direction]
  end

  def update
    case @direction
      when :up
        @y -= 2
      when :down
        @y += 2
      when :left
        @x -= 2
      when :right
        @x += 2
    end
  end

  def die
    self.velocity = [0,0]
    between(0,50) { self.factor += 0.3; self.alpha -= 10; }.then { destroy }
  end

end