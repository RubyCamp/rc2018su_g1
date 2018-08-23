module Title2
  class Director
    BACKGROUND = Image.load('images/title_universe.png')
    BGM = Sound.new('sound/bgm_maoudamashii_neorock73.wav')

    def play
      Window.draw(0, 0, BACKGROUND)
      if Input.key_push?(K_SPACE)
        Scene.current = :game
        Scene[:game].change_bgm
      end
      if Input.key_push?(K_LEFT) || Input.key_push?(K_RIGHT)
        Scene.current = :title1
        Scene[:title1].change_bgm
      end
    end

    def change_bgm
      Scene[:title1].class::BGM.stop
      BGM.play
    end

    def change_game_bgm
      Scene[:game].class::BGM.stop
      BGM.play
    end
  end
end