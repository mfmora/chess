require_relative "piece.rb"


class Bishop < Piece
  include SlidingPiece

  def initialize(position, board, color)
    super(position,board,color,"B")
  end

  def move_dirs
    
  end


end
