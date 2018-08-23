module Ending
  class Director
    BACKGROUND = Image.load('images/background_ending.png')
    BGM = Sound.new('sound/bgm_ending.wav')

    def initialize
      @player_images = {
        'neko1' => Image.load('images/win1.png'),
        'neko2' => Image.load('images/win2.png')
      }
    end

    def play
      Window.draw(0, 0, BACKGROUND)

      result = Scene[:game].players.map{|player| [player.name, player.score] }.to_h
      winner = result.sort {|(k1, v1), (k2, v2)| v2 <=> v1 }.first
      img = @player_images[winner.first]
      Window.draw(Window.width / 2 - img.width / 2, 100, img)

      if Input.key_push?(K_SPACE)
        Scene.current = :title 
      end
    end

    def change_bgm
      Scene[:title].class::BGM.stop
      BGM.play
    end
  end
end
