class Enemy < TestObject
  def shoot
    return Sprite.new(self.x + (self.image.width / 2), self.y + self.image.height, Image.new(2, 32, C_RED)) if Input.key_push?(keys[:shoot])
    return Bullet.new(self.x + (self.image.width / 2), self.y + self.image.height, Image.new(4, 32, C_WHITE), "missile") if Input.key_push?(keys[:shoot_missile])
  end

  def draw_bullets
    @bullets << self.shoot if self.shoot != nil
    @bullets.each do |bullet|
      bullet.vanish if bullet.y >= 450
      bullet.draw
      bullet.y += 4
    end
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
end