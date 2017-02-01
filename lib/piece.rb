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

  def opposite_color
    color == :white ? :black : :white
  end

  def opponent_piece?(new_pos)
    @board.in_bounds?(new_pos) &&
    different_color?(new_pos) && !@board.empty_space?(new_pos)
  end

  def move_into_check?(end_pos)
    dup_board = @board.deep_dup
    dup_board.move_piece!(position,end_pos)
    dup_board.in_check?(color)
  end

  def valid_moves
    moves.reject {|pos| move_into_check?(pos)}
  end
end
