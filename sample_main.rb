require 'dxruby'
require_relative 'testobject'
require_relative 'player'
require_relative 'enemy'

player = Player.new(400, 400, Image.new(64, 32, C_WHITE))
enemy = Enemy.new(400, 50, Image.new(128, 64, C_RED))

Window.width = 800
Window.height = 450

Window.loop do
  player.update
  player.draw

  enemy.update
  enemy.draw

  player.draw_bullets
end
