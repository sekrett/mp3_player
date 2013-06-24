module Mp3Player
  module LayoutHelper
    if Rails.env.production?
      load_config_options
    else
      @@default_options = nil
    end

    def mp3_player_headers options = {}
      ViewHelper.reset_player_count

      # Don't reload configuration options in production env
      load_config_options if !Rails.env.production?

      options.reverse_merge! @@default_options if @@default_options
      options.reverse_merge!({ width: 290 })

      audio_player_path = if options[:with_swfobject] == false
                            'audio-player-noswfobject.js'
                          else
                            'audio-player.js'
                          end

      javascript_include_tag(audio_player_path) +
          %Q[
          <script type="text/javascript">
            AudioPlayer.setup("#{asset_path('player.swf')}/", #{options.to_json} );
          </script>].html_safe
    end

    private
    def load_config_options
      config_file_path = Rails.root.join('config', 'mp3_player.yml')
      @@default_options = if File.exists? config_file_path
                            YAML::load(File.open(config_file_path))
                          else
                            nil
                          end
    end
  end
end