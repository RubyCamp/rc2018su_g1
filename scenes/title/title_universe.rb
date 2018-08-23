module Title2
  class Director
    BACKGROUND = Image.load('images/title2.png')
    BGM = Sound.new('sound/bgm_maoudamashii_neorock73.wav')

    def play
      Window.draw(0, 0, BACKGROUND)
      if Input.key_push?(K_SPACE)
        Scene.current = :game2
        Scene[:game2].change_game_bgm
      end
      if Input.key_push?(K_LEFT)
        Scene.current = :title1
        Scene[:title1].change_bgm
      end
      if Input.key_push?(K_RIGHT)
        Scene.current = :title3
        Scene[:title3].change_bgm
      end
    end

    def change_bgm
      Scene[:title1].class::BGM.stop
      Scene[:title3].class::BGM.stop
      BGM.play
    end
  end
end
