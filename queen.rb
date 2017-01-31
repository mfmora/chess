require_relative "piece.rb"
require_relative "sliding_piece.rb"

class Queen < Piece
  include SlidingPiece

  def initialize(position, board, color)
    super(position,board,color,"Q")
  end

  def move_dirs
    :both
  end
end
