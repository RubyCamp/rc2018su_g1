require_relative 'testobject'
require_relative 'player'
require_relative 'enemy'
require_relative 'enemy_small'
require_relative 'bullet'
require_relative 'footer'

module Game2
  class Director

    BACKGROUND = Image.load('images/background_game.png')
    Earth = Image.load('images/earth.png')
    # P1_IMAGE = Image.load('images/player1.png')
    # P2_IMAGE = Image.load('images/player2.png')
    BGM = Sound.new('sound/bgm.wav')

    # BULLET1_IMAGE = Image.load('images/bullet1.png')
    # BULLET2_IMAGE = Image.load('images/bullet2.png')

    def initialize
      @font = Font.new(24)
      @player = Player.new(400 - 32, 550 - 32, Earth, nil)
      @enemy = Enemy.new(400 - 64, 50, Image.load('images/sun.png'), nil)
      @footer = Footer.new

      @player.enemy_bullets = @enemy.bullets
      @player.esmall_bullets = @enemy.bullets_small
      @enemy.enemy_bullets = @player.bullets
      
      @footer.enemy_bullets = @enemy.bullets
      @footer.player_bullets = @player.bullets
      @footer.esmall_bullets = @enemy.bullets_small

      @player_life = 3

      @font = Font.new(32)
      @player_life_list = [[30, 530], [85, 530], [140, 530]]
    end

    def play
      Window.draw(0, 0, BACKGROUND)
      Window.draw_font(0, Window.height - 32, (@player.remaining_bullets / 2).to_s, @font)
      
      @player_life_list.each do |x, y|
        Window.draw(x, y, Earth)
      end
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
        @player = Player.new(400 - 32, 550 - 32, Earth, nil)
        @player.enemy_bullets = @enemy.bullets
        @player.esmall_bullets = @enemy.bullets_small
        @enemy.enemy_bullets = @player.bullets
        @player_life -= 1
        @player_life_list.pop
        if @player_life <= 0
          Scene.current = :ending2
          Scene[:ending2].change_bgm
        end
      end
    end

    def change_game_bgm
      Scene[:title1].class::BGM.stop
      Scene[:title2].class::BGM.stop
      BGM.play
    end
  end
end
