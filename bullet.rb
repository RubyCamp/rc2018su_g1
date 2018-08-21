class Bullet < Sprite
  def initialize(*args, kind)
    super(*args)

    @kind = kind
  end

  def whatami
    return @kind
  end
end