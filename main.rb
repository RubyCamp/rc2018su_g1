require 'dxruby'
require_relative 'scene'
require_relative 'scenes/title/director'
require_relative 'scenes/title/title_universe'
require_relative 'scenes/game/director'
require_relative 'scenes/ending/director'

Window.width = 800
Window.height = 600

Scene.add(:title1, Title1::Director.new)
Scene.add(:title2, Title2::Director.new)
Scene.add(:game, Game::Director.new)
Scene.add(:ending, Ending::Director.new)

Scene.current = :title1

Scene[:title1].class::BGM.loop_count = -1 # 無限ループ
Scene[:title2].class::BGM.loop_count = -1
Scene[:game].class::BGM.loop_count = -1
Scene[:ending].class::BGM.loop_count = -1

Scene[:title1].class::BGM.play

Window.loop do
  break if Input.key_push?(K_ESCAPE)
  Scene.play
end
