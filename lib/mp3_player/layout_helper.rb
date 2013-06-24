module Mp3Player
  module LayoutHelper
    def mp3_player_headers options = {}
      ViewHelper.reset_player_count

      # Don't reload configuration options in production env
      Configuration.load_options if !Rails.env.production?

      options.reverse_merge! Mp3Player.default_options if Mp3Player.default_options
      options.reverse_merge!({ width: 290 })

      audio_player_path = if options[:with_swfobject] == false
                            'audio-player-noswfobject.js'
                          else
                            'audio-player.js'
                          end

      javascript_include_tag(audio_player_path) +
          %Q[
          <script type="text/javascript">
            AudioPlayer.setup("#{asset_path('player.swf')}", #{options.to_json} );
          </script>].html_safe
    end
  end
end