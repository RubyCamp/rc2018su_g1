module Ending2
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

      if Input.key_push?(K_SPACE)
        Scene.current = :title1
        Scene[:title1].change_bgm
      end
    end

    def change_bgm
      Scene[:game].class::BGM.stop
      BGM.play
    end
  end
end
