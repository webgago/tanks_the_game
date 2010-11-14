class Play < Chingu::GameState

  def initialize
    super
    @player = Player.create(:x => 200, :y => 200)

    #
    # More advanced input-maps, showing of multiple keys leading to the same method
    #
    @player.input = { [:holding_a, :holding_left, :holding_pad_left] => :move_left,
                      [:holding_d, :holding_right, :holding_pad_right] => :move_right,
                      [:holding_w, :holding_up, :holding_pad_up] => :move_up,
                      [:holding_s, :holding_down, :holding_pad_down] => :move_down,
                      [:space, :return, :pad_button_2] => :fire
                    }
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