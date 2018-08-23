module Title
  class Director
    BACKGROUND = Image.load('images/background_title.png')
    BGM = Sound.new('sound/Ro-Crazy.wav')

    def play
      Window.draw(0, 0, BACKGROUND)

      Scene.current = :game if Input.key_push?(K_SPACE)
    end
  end
end