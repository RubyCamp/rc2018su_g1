class Bullet < Sprite
  def initialize(*args, speed, kind)
    super(*args)

    @speed = speed
    @kind = kind
  end

  def whatami
    return @kind
  end

  def update
    self.y += @speed
    self.draw
    self.vanish if self.y <= 0 || self.y >= Window.width
  end
end