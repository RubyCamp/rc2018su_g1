class TestObject < Sprite
  def initialize(*args)
    super(*args)
    @speed = 3
  end

  def shoot
    return Sprite.new(self.x + (self.image.width / 2), self.y, Image.new(2, 32, C_WHITE)) if Input.key_down?(keys[:shoot])
  end
    
  def update
    self.x += @speed if Input.key_down?(keys[:right]) && self.x <= 700 - self.image.width
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