require 'mp3_player/version'

require 'mp3_player/view_helper'
require 'mp3_player/layout_helper'
require 'mp3_player/engine'
require 'mp3_player/configuration'
# includes the view and layout helpers to ActionView::Base
ActionView::Base.send(:include, Mp3Player::ViewHelper)
ActionView::Base.send(:include, Mp3Player::LayoutHelper)

module Mp3Player
  mattr_accessor :default_options
  @@default_options = nil
end
