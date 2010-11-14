# To change this template, choose Tools | Templates
# and open the template in the editor.

require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

require 'game'

describe Game do
  before(:each) do
    @game = Game.new
  end

  it "should desc" do
    @game.should be_a Game
  end
end

