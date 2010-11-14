$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')
require 'environment'

include Gosu

class Game < Chingu::Window
  def initialize
    super(640,480,false)              # leave it blank and it will be 800,600,non fullscreen
    self.input = { :f1 => :debug, [:q, :escape] => :exit }

    push_game_state(Play)
  end

  def debug
    push_game_state(Chingu::GameStates::Debug.new)
  end
  
end