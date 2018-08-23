module Game2
  class Footer < TestObject
    def initialize
      # ダメージの蓄積量を表す変数
      @damage_footer = 0
      # floorの線
      super(0, Window.height - 80, Image.new(800, 2, C_GREEN))
    end

    # enemyに攻撃されたときに増えるダメージ
    def hit
      @enemy_bullets.each do |enemy_bullet|
        if self===enemy_bullet
          enemy_bullet.vanish
          if @damage_footer <= 430
            #p enemy_bullet.whatami
            @damage_footer += 20
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
end