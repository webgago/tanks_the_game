# To change this template, choose Tools | Templates
# and open the template in the editor.

require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Tanks do
  it "should has root method" do
    Tanks.root.to_s.should == '/home/anton/Dropbox/projects/tanks/lib'
  end

  it "should has media method" do
    Tanks.media.to_s.should == '/home/anton/Dropbox/projects/tanks/media'
  end

  it "should load images from media" do
    Gosu::Image.autoload_dirs.include?(Tanks.media).should be_true
  end
end

