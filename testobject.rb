class TestObject < Sprite
  def initialize(*args)
    super(*args)
    @speed = 3
  end
    
  def update
    self.x += @speed if Input.key_down?(keys[:right]) && self.x <= 600
    self.x -= @speed if Input.key_down?(keys[:left]) && self.x >= 200
    #self.y += @speed if Input.key_down?(keys[:down])
    #self.y -= @speed if Input.key_down?(keys[:up])
  end

  def keys
    {
      right: K_D,
      left: K_A,
      down: K_S,
      up: K_W
    }
  end
end