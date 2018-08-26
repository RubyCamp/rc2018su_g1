module Title3
  class Director
    BACKGROUND = Image.load('images/cthulhu.png')
    BGM = Sound.new('sound/shinenkaranoyobigoe.wav')

    def play
      Window.draw(0, 0, BACKGROUND)
      if Input.key_push?(K_SPACE)
        Scene.current = :game3
        Scene[:game3].change_game_bgm
      end
      if Input.key_push?(K_LEFT)
        Scene.current = :title2
        Scene[:title2].change_bgm
      end
      if Input.key_push?(K_RIGHT)
        Scene.current = :title1
        Scene[:title1].change_bgm
      end
    end

    def change_bgm
      Scene[:ending3].class::BGM.stop
      Scene[:title1].class::BGM.stop
      Scene[:title2].class::BGM.stop
      BGM.play
    end
  end
end
