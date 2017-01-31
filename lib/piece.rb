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

  def opponent_piece?(new_pos)
    different_color?(new_pos) && !empty_space?(new_pos)
  end

  def empty_space?(new_pos)
    @board[new_pos].is_a?(NullPiece)
  end
end
