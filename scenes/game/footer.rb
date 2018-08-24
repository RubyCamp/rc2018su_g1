class Footer < TestObject
  def initialize
    # ダメージの蓄積量を表す変数
    @damage_footer = 0
    @player_bullets
    @esmall_bullets
    # floorの線
    super(0, Window.height - 80, Image.new(800, 2, C_GREEN))
  end
  attr_writer :player_bullets
  attr_writer :esmall_bullets

  # enemyに攻撃されたときに増えるダメージ
  def hit
    @enemy_bullets.each do |enemy_bullet|
      if self===enemy_bullet
        enemy_bullet.vanish
        if @damage_footer <= 430
          #p enemy_bullet.whatami
          @damage_footer += 20
        else
          @@damage_enemy = 0
          @enemy_bullets.clear
          @player_bullets.clear
          @esmall_bullets.clear
          Scene.current = :ending
          Scene[:ending].change_bgm
        end
      end
    end
    Sprite.clean(@enemy_bullets)
  end

  #ゲージを描画
  def gage
    Window.draw(8, 61, Image.new(14, 440, C_WHITE))
    Window.draw(10, 500 - @damage_footer, Image.new(10, 1 + @damage_footer, C_RED))
  end
end
