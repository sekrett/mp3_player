class Mp3PlayerGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  class_option :swfobject, :type => :boolean, :default => true, :desc => 'Use included swfobject library'

  def copy_player
    copy_file 'player.swf', 'public/player.swf'
  end
  
  def copy_audio_player_js
    if options[:swfobject]
      copy_file 'audio-player.js', 'public/javascripts/audio-player.js'
    else
      copy_file 'audio-player-noswfobject.js', 'public/javascripts/audio-player-noswfobject.js'
    end
  end
end
