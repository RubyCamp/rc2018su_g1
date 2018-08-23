class Enemy < TestObject
  def hit
    @enemy_bullets.each do |enemy_bullet|
      enemy_bullet.vanish if self===enemy_bullet
    end
    Sprite.clean(@enemy_bullets)
  end

  def shoot
    return Bullet.new(self.x + (@width / 2), self.y, Image.new(2, 32, C_RED), 4, "normal") if Input.key_push?(keys[:shoot])
    return Bullet.new(self.x + (@width / 2), self.y, Image.new(4, 32, C_RED), 10, "missile") if Input.key_push?(keys[:shoot_missile])
  end

  def draw_bullets
    @bullets << self.shoot if self.shoot != nil
    Sprite.update(@bullets)
    Sprite.clean(@bullets)
  end

  def update
    self.x += @speed if Input.key_down?(keys[:right]) && self.x <= 700 - @width
    self.x -= @speed if Input.key_down?(keys[:left]) && self.x >= 100
    self.y += @speed if Input.key_down?(keys[:down])
    self.y -= @speed if Input.key_down?(keys[:up])
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
