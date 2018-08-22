class Enemy_small < TestObject
  def initialize(x, y)
    super(x, y, Image.new(32, 32, C_BLUE))

    @enemy_bullets
  end
  attr_writer :enemy_bullets

  def hit
    @enemy_bullets.each do |enemy_bullet|
      if self===enemy_bullet
        enemy_bullet.vanish
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