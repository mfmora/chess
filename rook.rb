require_relative "piece.rb"


class Rook < Piece
  include SlidingPiece

  def initialize(position, board, color)
    super(position,board,color,"R")
  end

  def move_dirs

  end
end
