require_relative "piece.rb"
require_relative "sliding_piece.rb"

class Rook < Piece
  include SlidingPiece

  def initialize(position, board, color)
    super(position,board,color,set_symbol(color))
  end

  def move_dirs
    :horizontal_vertical
  end

  def set_symbol(color)
    color == :white ? "\u{2656}" : "\u{265C}"
  end
end
