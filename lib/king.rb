require_relative "piece.rb"
require_relative "stepping_piece.rb"

class King < Piece
  include SteppingPiece

  def initialize(position, board, color)
    super(position,board,color,set_symbol(color))
  end

  def set_symbol(color)
    color == :white ? "\u{2654}" : "\u{265A}"
  end

end
