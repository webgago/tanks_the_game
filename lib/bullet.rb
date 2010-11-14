class Bullet < Chingu::GameObject
  #
  # If we need our own initialize, just call super and Chingu does it's thing.
  # Here we merge in an extra argument, specifying the bullet-image.
  #
  def initialize(options)
    super(options.merge(:image => Image["fire_bullet.png"]))
  end

  # Move the bullet forward
  def update
    @y -= 2
  end

end