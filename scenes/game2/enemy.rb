module Game2
  class Enemy < TestObject
    @@damage_enemy = 0
    def initialize(*args)
      super(*args)

      @bullets_small = []
      @COMET = Sound.new('sound/comet.wav')
    end
    attr_reader :bullets_small

    def hit
      @enemy_bullets.each do |enemy_bullet|
        if self===enemy_bullet
          enemy_bullet.vanish
          #ダメージ量は要調整
            @@damage_enemy += 10 if enemy_bullet.whatami == "normal"
            @@damage_enemy += 20 if enemy_bullet.whatami == "missile"
          if @@damage_enemy >= 780
            Scene.current = :ending2
            Scene[:ending2].change_bgm
            @enemy_bullets.clear
            @@damage_enemy = 0
          end
        end
      end
      Sprite.clean(@enemy_bullets)
    end

    def shoot
      if Input.key_push?(keys[:shoot]) && @bullets.size <= 10
        @COMET.play
        return Enemy_small.new(self.x + (@width / 2), self.y + @height)
      end
    end

    def draw_bullets
      @bullets << self.shoot if self.shoot != nil
      @bullets.each do |bullet|
        @bullets_small.concat(bullet.bullets)
        bullet.enemy_bullets = @enemy_bullets
        bullet.draw_bullets
        bullet.hit
      end
      Sprite.update(@bullets)
      Sprite.clean(@bullets)
    end

    def keys
      {
        right: K_RIGHT,
        left: K_LEFT,
        down: K_DOWN,
        up: K_UP,
        shoot: K_RETURN,
        shoot_missile: K_X
      }
    end

    def gage
      Window.draw(8, 20, Image.new(782, 14, C_WHITE))
      Window.draw(9, 21, Image.new(781 - @@damage_enemy, 12, C_RED))
    end
  end
end