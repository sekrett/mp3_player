module Mp3Player
  module LayoutHelper
    def mp3_player_headers options = {}
      if File.exists?(Rails.root.join('public', 'javascripts', 'audio-player.js'))
        audio_player_path = 'audio-player.js'
      elsif File.exists?(Rails.root.join('public', 'javascripts', 'audio-player-noswfobject.js'))
        audio_player_path = 'audio-player-noswfobject.js'
      else
        logger.warn "WARNING: Missing js file. Did you run 'rails generate mp3_player'?"
        return
      end
      
      ViewHelper.reset_player_count

      file = File.open("#{Rails.root}/config/mp3_player.yml")
      if Rails.env.production?
        default_options = YAML::load(file) if default_options.nil?
      else
        default_options = YAML::load(file)
      end
      options.reverse_merge! default_options
      options.reverse_merge!({ width: 290 })

      javascript_include_tag(audio_player_path) +
        %Q[
          <script type="text/javascript">
            AudioPlayer.setup("/player.swf", #{options.to_json} );
          </script>].html_safe
    end
  end
end