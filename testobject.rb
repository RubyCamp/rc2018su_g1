#require_relative 'bullet'

class TestObject < Sprite
  def initialize(*args, enemy)
    super(*args)
    @speed = 3 #移動速度
    @width = self.image.width #自機の幅
    @height = self.image.height #自機の高さ
    @bullets = [] #弾
    @missiles = [] #弾(ミサイル)
    @count = 0
  end
  attr_accessor :enemy

  def hit

  end

  def shoot
    return Bullet.new(self.x + (@width / 2), self.y, Image.new(2, 32, C_WHITE), "normal") if Input.key_push?(keys[:shoot])
    return Bullet.new(self.x + (@width / 2), self.y, Image.new(4, 32, C_WHITE), "missile") if Input.key_push?(keys[:shoot_missile])
  end

  def draw_bullets
    @bullets << self.shoot if self.shoot != nil && self.shoot.whatami == "normal"
    @bullets.each do |bullet|
      bullet.vanish if bullet.y <= 0
      bullet.draw
      bullet.y -= 4
    end
    @missiles << self.shoot if self.shoot != nil && self.shoot.whatami == "missile"
    @missiles.each do |missile|
      missile.vanish if missile.y <= 0
      missile.draw
      missile.y -= 20
    end
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