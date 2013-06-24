module Mp3Player
  module Generators
    class YmlGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)
      desc 'Creates a config/mp3_player.yml file for setting global options.'

      def copy_yml
        copy_file 'mp3_player.yml', 'config/mp3_player.yml'
      end
    end
  end
end
