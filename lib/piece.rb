class Piece

  attr_accessor :position, :board, :color, :symbol

  def initialize(position, board, color, symbol)
    @position = position
    @board = board
    @color = color
    @symbol = symbol
  end

  def to_s
    symbol
  end

  def different_color?(new_pos)
    @board[new_pos].color != @color
  end
end
