module Mp3Player
  # Required for assets to be discoverable in the asset pipeline
  # @private
  class Engine < ::Rails::Engine
    initializer 'mp3_player.assets_precompile', group: :all do |app|
          app.config.assets.precompile += [
              'audio-player.js',
              'audio-player-noswfobject.js',
              'player.swf'
          ]
    end

    initializer 'mp3_player.load_options' do
      Configuration.load_options
    end
  end
end
