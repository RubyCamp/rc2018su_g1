module Ending
  class Director
    BACKGROUND = Image.load('images/hogehoge_gameset.png')
    BGM = Sound.new('sound/bgm_ending.wav')

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
