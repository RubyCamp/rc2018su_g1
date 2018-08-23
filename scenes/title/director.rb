module Title1
  class Director
    BACKGROUND = Image.load('images/hogehoge.png')
    BGM = Sound.new('sound/Ro-Crazy.wav')

    def play
      Window.draw(0, 0, BACKGROUND)
      if Input.key_push?(K_SPACE)
        Scene.current = :game
        Scene[:game].change_game_bgm
      end
      if Input.key_push?(K_RIGHT) || Input.key_push?(K_LEFT)
        Scene.current = :title2
        Scene[:title2].change_bgm
      end
    end

    def change_bgm
      Scene[:title2].class::BGM.stop
      BGM.play
    end
  end
end