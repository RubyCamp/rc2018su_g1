module Ending3
  class Director
    BACKGROUND = Image.load('images/cthulhu_gameset1.png')
    BGM = Sound.new('sound/higan.wav')

    def play
      Window.draw(0, 0, BACKGROUND)

      if Input.key_push?(K_SPACE)
        Scene.current = :title1
        Scene[:title1].change_bgm
      end
    end

    def change_bgm
      Scene[:game3].class::BGM.stop
      BGM.play
    end
  end
end
