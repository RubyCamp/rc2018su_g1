class Player < TestObject
  def keys
    {
      right: K_D,
      left: K_A,
      down: K_S,
      up: K_W,
      shoot: K_SPACE
    }
  end
end