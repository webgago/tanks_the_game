class Intro < Chingu::GameState

  def initialize
    super
    self.input = { :f1 => :debug, [:q, :escape] => :exit }
  end

  def debug
    push_game_state(Chingu::GameStates::Debug.new)
  end

  #
  # If we want to add extra graphics drawn just define your own draw.
  # Be sure to call #super for enabling Chingus autodrawing of instances of GameObject.
  # Putting #super before or after the background-draw-call really doesn't matter since Gosu work with "zorder".
  #
  def draw
    # Raw Gosu Image.draw(x,y,zorder)-call
    Image["background1.png"].draw(0, 0, 0)
    super
  end

  #
  # Gosus place for gamelogic is #update in the mainwindow
  #
  # A #super call here would call #update on all Chingu::GameObject-instances and check their inputs, and call the specified method.
  #
  def update
    super
    $window.caption = "FPS: #{$window.fps} - milliseconds_since_last_tick: #{$window.milliseconds_since_last_tick} - game objects# #{current_game_state.game_objects.size}"
  end
end