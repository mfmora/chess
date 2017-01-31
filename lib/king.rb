require_relative "piece.rb"
require_relative "stepping_piece.rb"

class King < Piece
  include SteppingPiece

  def initialize(position, board, color)
    super(position,board,color,"K")
  end

end
