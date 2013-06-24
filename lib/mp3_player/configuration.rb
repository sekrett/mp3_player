module Mp3Player
  class Configuration
    def self.load_options
      config_file_path = Rails.root.join('config', 'mp3_player.yml')
      if File.exists? config_file_path
        Mp3Player.default_options = YAML::load(File.open(config_file_path))
      end
    end
  end
end