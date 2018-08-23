require_relative 'testobject'
require_relative 'player'
require_relative 'enemy'
#require_relative 'small_enemy'
require_relative 'bullet'

module Game
  class Director

    BACKGROUND = Image.load('images/background_game.png')
    P1_IMAGE = Image.load('images/player1.png')
    P2_IMAGE = Image.load('images/player2.png')

    BULLET1_IMAGE = Image.load('images/bullet1.png')
    BULLET2_IMAGE = Image.load('images/bullet2.png')

    def initialize
      @font = Font.new(24)
      @player = Player.new(400 - 32, 400 - 32, Image.new(64, 32, C_WHITE), nil)
      @enemy = Enemy.new(400 - 64, 50, Image.new(128, 64, C_RED), nil)

      @player.enemy_bullets = @enemy.bullets
      @enemy.enemy_bullets = @player.bullets

      @player_life = 3

    end

    def play
      Window.draw(0, 0, BACKGROUND)

      @player.update
      @player.draw

      @enemy.update
      @enemy.draw

      @player.draw_bullets
      @player.hit

      @enemy.draw_bullets
      @enemy.hit

      if @player.vanished?
        Sprite.clean(@player)
        @player = Player.new(400 - 32, 400 - 32, Image.new(64, 32, C_WHITE), nil)
        @player.enemy_bullets = @enemy.bullets
        @enemy.enemy_bullets = @player.bullets
        @player_life -= 1
        #Window.close if @player_life <= 0
      end
    end
  end
end
