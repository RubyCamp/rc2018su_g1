class TestObject < Sprite
  def initialize(*args)
    super(*args)
    @speed = 3
    @whidth = self.image.width
    @bullets = []
    @count = 0
  end

  def shoot
    return Sprite.new(self.x + (self.image.width / 2), self.y, Image.new(2, 32, C_WHITE)) if Input.key_push?(keys[:shoot])
  end

  def draw_bullets
    @bullets << self.shoot if self.shoot != nil
    @bullets.each do |bullet|
      bullet.vanish if bullet.y <= 0
      bullet.draw
      bullet.y -= 4
    end
  end
    
  def update
    self.x += @speed if Input.key_down?(keys[:right]) && self.x <= 700 - @whidth
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
      shoot: K_SPACE
    }
  end
end