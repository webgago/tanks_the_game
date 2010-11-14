# To change this template, choose Tools | Templates
# and open the template in the editor.

require 'pathname'

module Tanks

  class << self
    def root
      ::Pathname.new File.expand_path(File.dirname(__FILE__), '..')
    end

    def media
      root.join('..','media').expand_path
    end

    def initialize!
      autoloads!
    end

    def autoloads!
      Gosu::Image.autoload_dirs << Tanks.media.join('images')
      Gosu::Image.autoload_dirs << Tanks.media
      Gosu::Sound.autoload_dirs << Tanks.media.join('sound')
    end
  end

end
