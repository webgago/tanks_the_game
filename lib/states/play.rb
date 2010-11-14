class Play < Chingu::GameState
  trait :viewport
  def initialize
    super
    @player = Player.create(:x => 200, :y => 200)
    @walls = [2,4,6,8,10,12,14,16].map do |i|
      Wall.create(:x => 16 * i + 16, :y => 32 * i)
      Wall.create(:x => 16 * i, :y => 32 * i + 16)
      Wall.create(:x => 16 * i + 16, :y => 32 * i + 16)
      Wall.create(:x => 16 * i, :y => 32 * i)
    end

    #
    # More advanced input-maps, showing of multiple keys leading to the same method
    #
    @player.input = { [:holding_a, :holding_left, :holding_pad_left] => :move_left,
                      [:holding_d, :holding_right, :holding_pad_right] => :move_right,
                      [:holding_w, :holding_up, :holding_pad_up] => :move_up,
                      [:holding_s, :holding_down, :holding_pad_down] => :move_down,
                      [:space, :return, :pad_button_2] => :fire,
                      :mouse_left => :fire
                    }
    self.input = { :f1 => :debug, [:q, :escape] => :exit }
    Sound['Start1.ogg'].play
  end

  def debug
    push_game_state(Chingu::GameStates::Debug.new)
  end

  def update
    super
    Bullet.each_collision(Wall) do |bullet, wall|
      bullet.destroy
      wall.hit!
    end

    # Destroy game objects that travels outside the viewport
    game_objects.destroy_if { |game_object| self.viewport.outside_game_area?(game_object)  }

  end
end