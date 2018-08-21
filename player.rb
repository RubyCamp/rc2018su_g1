class Player < TestObject
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
      missile.y -= 10
    end
  end

  def keys
    {
      right: K_D,
      left: K_A,
      down: K_S,
      up: K_W,
      shoot: K_SPACE,
      shoot_missile: K_LCONTROL
    }
  end
end