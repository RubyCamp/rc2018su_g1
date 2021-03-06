module Game2
  class Player < TestObject
    def initialize(*args)
      super(*args)

      @esmall_bullets
      @COMET_EX = Sound.new('sound/comet_ex.wav')
    end
    attr_writer :esmall_bullets

    def hit
      super

      if @esmall_bullets != nil
        @esmall_bullets.each do |esmall_bullet|
          if self===esmall_bullet
            esmall_bullet.vanish
            self.vanish
            @COMET_EX.play
            break
          end
        end
      end
      Sprite.clean(@esmall_bullets)
    end
  #  def draw_bullets
  #    @bullets << self.shoot if self.shoot != nil && self.shoot.whatami == "normal"
  #    @bullets.each do |bullet|
  #      bullet.speed = -4
  #      bullet.update
  #    end
  #    @missiles << self.shoot if self.shoot != nil && self.shoot.whatami == "missile"
  #    @missiles.each do |missile|
  #      missile.speed = -10
  #      missile.update
  #    end
  #  end

    def keys
      {
        right: K_D,
        left: K_A,
        down: K_S,
        up: K_W,
        shoot: K_SPACE,
        shoot_missile: K_B
      }
    end



  def images
    {
      cube: 'images/cube.png',
      missile: 'images/missile.png'
    }
  end
  end
end