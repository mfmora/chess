require_relative "piece.rb"
require "singleton"

class NullPiece < Piece
  include Singleton

  def initialize
    @color = :green
  end

  def moves
  end

end
