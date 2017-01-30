class Piece

  attr_accessor :position

  def initialize(position)
    @position = position
  end

  def to_s
    "P"
  end
end
