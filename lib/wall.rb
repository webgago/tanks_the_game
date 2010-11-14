class Wall < Chingu::GameObject
  trait :bounding_circle, :debug => false
  trait :collision_detection

  traits :velocity, :timer

  def initialize(options)
    super(options.merge(:image => Image["wall.png"]))
    @direction = options[:direction] || :up
    @angles = {:up => 90, :down => -90, :left => 0, :right => 180}
    self.angle = @angles[@direction]
    cache_bounding_circle
    @hp = 100
  end

  def hit!
    @hp -= 25
    die if @hp < 1
  end

  def die
    between(0,50) { self.factor += 0.3; self.alpha -= 10; }.then { destroy }
  end
end