class Game < Chingu::Window
  def initialize
    #
    # 1) Create a new Intro-object and activate it (pushing to the top).
    # This version makes more sense if you want to pass parameters to the gamestate, for example:
    # push_game_state(Level.new(:level_nr => 10))
    #
    push_game_state(Intro.new)

    # 
    # 2) This leaves the actual object-creation to the game state manager.
    # Intro#initialize() is called, then Intro#setup()
    #
    push_game_state(Intro)
  end
end