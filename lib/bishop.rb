require_relative "piece.rb"
require_relative "sliding_piece.rb"

class Bishop < Piece
  include SlidingPiece

  def initialize(position, board, color)
    super(position,board,color,set_symbol(color))
  end

  def set_symbol(color)
    color == :white ? "\u{2657}" : "\u{265D}"
  end

  def move_dirs
    :diagonal
  end


end
