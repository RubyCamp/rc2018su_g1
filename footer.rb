class Footer < TestObject
  def initialize
    # ダメージの蓄積量を表す変数
    @damage_footer = 0
    # floorの線
    super(0, Window.height - 50, Image.new(800, 5, C_GREEN))
  end

  # enemyに攻撃されたときに増えるダメージ
  def hit
    @enemy_bullets.each do |enemy_bullet|
      if self===enemy_bullet
        enemy_bullet.vanish
        if @damage_footer <= 340
          # 通常攻撃
          if enemy_bullet.whatami == "normal"
            @damage_footer += 20
          end
          #ミサイル攻撃
          if enemy_bullet.whatami == "missile"
            @damage_footer += 40
          end
        end
      end
    end
    Sprite.clean(@enemy_bullets)
  end

  #ゲージを描画
  def gage
    Window.draw(8, 41, Image.new(14, 360, C_WHITE))
    Window.draw(10, 400 - @damage_footer, Image.new(10, 1 + @damage_footer, C_RED))
  end
end