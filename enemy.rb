class Enemy < TestObject
  def hit
    @enemy_bullets.each do |enemy_bullet|
      enemy_bullet.vanish if self===enemy_bullet
    end
    Sprite.clean(@enemy_bullets)
  end

  def shoot
    #return Bullet.new(self.x + (@width / 2), self.y, Image.new(2, 32, C_RED), 4, "normal") if Input.key_push?(keys[:shoot])
    #return Bullet.new(self.x + (@width / 2), self.y, Image.new(4, 32, C_RED), 10, "missile") if Input.key_push?(keys[:shoot_missile])
    return Enemy_small.new(self.x + (@width / 2), self.y) if Input.key_push?(keys[:shoot])
  end

  def draw_bullets
    @bullets << self.shoot if self.shoot != nil
    @bullets.each do |bullet|
      bullet.enemy_bullets = @enemy_bullets
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
end