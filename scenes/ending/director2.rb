module Ending2
  class Director
    BACKGROUND = Image.load('images/background_ending.png')
    BGM = Sound.new('sound/bgm_ending.wav')

    def play
      Window.draw(0, 0, BACKGROUND)

      if Input.key_push?(K_SPACE)
        Scene.current = :title1
        Scene[:title1].change_bgm
      end
    end

    def change_bgm
      Scene[:game2].class::BGM.stop
      BGM.play
    end
  end
end
