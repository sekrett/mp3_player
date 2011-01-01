module Mp3Player
  module LayoutHelper
    def mp3_player_headers options = {}
      if File.exists?(Rails.root.join('public', 'javascripts', 'audio-player.js'))
        audio_player_path = 'audio-player.js'
      elsif File.exists?(Rails.root.join('public', 'javascripts', 'audio-player-noswfobject.js'))
        audio_player_path = 'audio-player-noswfobject.js'
      else
        logger.warn "Missing js file. Did you run 'rails generate mp3_player'?"
      end
      
      ViewHelper.reset_player_count
      options.reverse_merge!({ width: 290 })
      
      javascript_include_tag(audio_player_path) +
        %Q[
          <script type="text/javascript">
            AudioPlayer.setup("/player.swf", #{options.to_json} );
          </script>].html_safe
    end
  end
end