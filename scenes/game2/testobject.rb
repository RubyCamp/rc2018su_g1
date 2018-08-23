class TestObject < Sprite
  def initialize(*args)
    super(*args)
    @speed = 3 #移動速度
    @width = self.image.width #自機の幅
    @height = self.image.height #自機の高さ
    @bullets = [] #弾
    @count = 0
    @enemy_bullets
    @GUN = Sound.new(sound[:gun])
    @MISSILE = Sound.new(sound[:missile])
    @remaining_bullets = 30
    @counter = 0
  end
  attr_accessor :bullets
  attr_accessor :enemy_bullets
  attr_accessor :remaining_bullets

  def hit
    @enemy_bullets.each do |enemy_bullet|
      if self===enemy_bullet
        enemy_bullet.vanish
        self.vanish
        break
      end
    end
    Sprite.clean(@enemy_bullets)
  end

  def shoot
    if Input.key_push?(keys[:shoot])
      @GUN.play
      return Bullet.new(self.x + (@width / 2) - 5, self.y, Image.load(images[:cube]), -4, "normal")
    end
    # return Bullet.new(self.x + (@width / 2), self.y, Image.new(2, 32, C_WHITE), -4, "normal") if Input.key_push?(keys[:shoot])
    if Input.key_push?(keys[:shoot_missile]) && @remaining_bullets > 0
      @MISSILE.play
      @remaining_bullets -= 1
      return Bullet.new(self.x + (@width / 2) - 8, self.y, Image.load(images[:missile]), -10, "missile")
    end
    # return Bullet.new(self.x + (@width / 2), self.y, Image.load('images/missile.png'), -10, "missile") if Input.key_push?(keys[:shoot_missile])
  end

  def draw_bullets
    @bullets << self.shoot if self.shoot != nil
    Sprite.update(@bullets)
    Sprite.clean(@bullets)
  end
    
  def update
    self.x += @speed if Input.key_down?(keys[:right]) && self.x <= Window.width - 100 - @width
    self.x -= @speed if Input.key_down?(keys[:left]) && self.x >= 100
    #self.y += @speed if Input.key_down?(keys[:down])
    #self.y -= @speed if Input.key_down?(keys[:up])

    @counter += 1
    if @counter == 180
      @counter = 0
      #p "test"
      @remaining_bullets += 2
    end
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

  def sound
    {
      gun: 'sound/battle_gun.wav',
      missile: 'sound/explosion.wav'
    }
  end
end
