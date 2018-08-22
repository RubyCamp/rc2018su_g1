class TestObject < Sprite
  def initialize(*args)
    super(*args)
    @speed = 3 #移動速度
    @width = self.image.width #自機の幅
    @height = self.image.height #自機の高さ
    @bullets = [] #弾
    @count = 0
    @enemy_bullets
  end
  attr_accessor :bullets
  attr_accessor :enemy_bullets

  def hit
    @enemy_bullets.each do |enemy_bullet|
      enemy_bullet.vanish if self===enemy_bullet
    end
    Sprite.clean(@enemy_bullets)
  end

  def shoot
    return Bullet.new(self.x + (@width / 2), self.y, Image.new(2, 32, C_WHITE), -4, "normal") if Input.key_push?(keys[:shoot])
    return Bullet.new(self.x + (@width / 2), self.y, Image.new(4, 32, C_WHITE), -10, "missile") if Input.key_push?(keys[:shoot_missile])
  end

  def draw_bullets
    @bullets << self.shoot if self.shoot != nil
    Sprite.update(@bullets)
    Sprite.clean(@bullets)
  end
    
  def update
    self.x += @speed if Input.key_down?(keys[:right]) && self.x <= 700 - @width
    self.x -= @speed if Input.key_down?(keys[:left]) && self.x >= 100
    #self.y += @speed if Input.key_down?(keys[:down])
    #self.y -= @speed if Input.key_down?(keys[:up])
  end

  def keys
    {
      right: K_D,
      left: K_A,
      down: K_S,
      up: K_W,
      shoot: K_SPACE,
      shoot_missile: K_CONTROL
    }
  end
end