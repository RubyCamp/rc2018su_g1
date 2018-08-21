require 'dxruby'
require_relative 'testobject'
require_relative 'player'
require_relative 'enemy'
require_relative 'bullet'

player = Player.new(400, 400, Image.new(64, 32, C_WHITE), nil)
enemy = Enemy.new(400, 50, Image.new(128, 64, C_RED), nil)

player.enemy = enemy
enemy.enemy = player

Window.width = 800
Window.height = 450

Window.loop do
  player.update
  player.draw

  enemy.update
  enemy.draw

  player.draw_bullets

  enemy.draw_bullets
end
