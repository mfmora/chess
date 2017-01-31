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
    different_color?(new_pos) && !@board.empty_space?(new_pos)
  end

  def move_into_check?(end_pos)
    dup_board = @board.deep_dup
  end
end
