require_relative "piece.rb"
require_relative "sliding_piece.rb"

class Queen < Piece
  include SlidingPiece

  def initialize(position, board, color)
    super(position,board,color,set_symbol(color))
  end

  def move_dirs
    :both
  end

  def set_symbol(color)
    color == :white ? "\u{2655}" : "\u{265B}"
  end
end
