class Enemy < TestObject
  def initialize(*args)
    super(*args)

    @bullets_small = []
  end
  attr_reader :bullets_small

  def hit
    @enemy_bullets.each do |enemy_bullet|
      enemy_bullet.vanish if self===enemy_bullet
    end
    Sprite.clean(@enemy_bullets)
  end

  def shoot
    return Enemy_small.new(self.x + (@width / 2), self.y + @height) if Input.key_push?(keys[:shoot])
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
end