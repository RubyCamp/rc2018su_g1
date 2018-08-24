require_relative 'testobject'
require_relative 'player'
require_relative 'enemy'
require_relative 'enemy_small'
require_relative 'bullet'
require_relative 'footer'

module Game3
  class Director


    BACKGROUND = Image.load('images/Halftone M.png')
    #P1_IMAGE = Image.load('images/nautical52.png')
    #P2_IMAGE = Image.load('images/nautical52 41.png')
    BGM = Sound.new('sound/azato.wav')

    #BULLET1_IMAGE = Image.load('images/nautical13.png')
    #BULLET2_IMAGE = Image.load('images/nautical13.png')

    def initialize
      @font = Font.new(24)
      @player = Player.new(400 - 32, 480 - 32, Image.load('images/nautical52.png'), nil)
      @enemy = Enemy.new(400 - 64, 50, Image.load('images/nautical 41.png'), nil)
      @footer = Footer.new

      @player.enemy_bullets = @enemy.bullets
      @player.esmall_bullets = @enemy.bullets_small
      @enemy.enemy_bullets = @player.bullets

      @footer.enemy_bullets = @enemy.bullets

      @player_life = 3
    end

    def play
      Window.draw(0, 0, BACKGROUND)
      Window.draw_font(0, Window.height - 32, (@player.remaining_bullets / 2).to_s, @font)

      @footer.draw
      @footer.gage

      @player.update
      @player.draw

      @enemy.update
      @enemy.draw

      @player.draw_bullets
      @player.hit

      @enemy.draw_bullets
      @enemy.hit
      @enemy.gage
      #if @enemy.shoot != nil
      #  p @enemy.shoot
      #end
      @footer.hit

      if @player.vanished?
        Sprite.clean(@player)
        @player = Player.new(400 - 32, 480 - 32, Image.load('images/nautical52.png'), nil)
        @player.enemy_bullets = @enemy.bullets
        @player.esmall_bullets = @enemy.bullets_small
        @enemy.enemy_bullets = @player.bullets
        @player_life -= 1
        if @player_life <= 0
          Scene.current = :ending3
          Scene[:ending3].change_bgm
        end
        #Window.close if @player_life <= 0
      end
    end

    def change_game_bgm
      Scene[:title3].class::BGM.stop
      BGM.play
    end
  end
end
