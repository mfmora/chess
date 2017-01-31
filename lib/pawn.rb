require_relative "piece.rb"


class Pawn < Piece

  def initialize(position, board, color)
    super(position,board,color,"P")
  end

  def moves
  end
end
