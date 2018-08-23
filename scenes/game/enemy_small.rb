module Game
  class Enemy_small < TestObject
    def initialize(x, y)
      super(x, y, Image.new(32, 32, C_BLUE))

      @enemy_bullets
      @counter = 0
    end
    attr_writer :enemy_bullets
    attr_accessor :bullets

    def shoot
      @counter += 1
      if @counter == 60
        @counter = 0
        #p "test"
        return Bullet.new(self.x + (@width / 2), self.y, Image.new(2, 32, C_RED), 4, "normal")
      end
    end

    def draw_bullets
      bullet = self.shoot
      @bullets << bullet if bullet != nil
      #p bullet if bullet != nil
      Sprite.update(@bullets)
      Sprite.clean(@bullets)
    end

    def hit
      @enemy_bullets.each do |enemy_bullet|
        if self===enemy_bullet
          enemy_bullet.vanish
          @bullets.each do |bullet|
            bullet.vanish
  #          p bullet.vanished?
          end
          Sprite.clean(@bullets)
          self.vanish
          break
        end
      end
      Sprite.clean(@enemy_bullets)
    end

    def update
      self.y += 1
      self.draw
      self.vanish if self.y <= 0 || self.y >= Window.width
    end
  end
end