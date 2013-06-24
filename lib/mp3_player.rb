require 'mp3_player/version'

require 'mp3_player/view_helper'
require 'mp3_player/layout_helper'
require 'mp3_player/engine'
# includes the view and layout helpers to ActionView::Base
ActionView::Base.send(:include, Mp3Player::ViewHelper)
ActionView::Base.send(:include, Mp3Player::LayoutHelper)

