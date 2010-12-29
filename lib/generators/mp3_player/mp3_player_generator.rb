class Mp3PlayerGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def copy_player
    copy_file 'player.swf', 'public/player.swf'
  end
end
