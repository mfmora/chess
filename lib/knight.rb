require_relative "piece.rb"
require_relative "stepping_piece.rb"

class Knight < Piece
  include SteppingPiece

  def initialize(position, board, color)
    super(position,board,color,set_symbol(color))
  end

  def set_symbol(color)
    color == :white ? "\u{2658}" : "\u{265E}"
  end

end
