require_relative 'piece_helper.rb'
require_relative 'nullpiece.rb'
require 'byebug'
class Board

  PIECES_BY_INDEX = {
    0 => [Rook,Knight,Bishop,King,Queen,Bishop,Knight,Rook],
    1 => [Pawn]*8,
    2 => nil,
    3 => nil,
    4 => nil,
    5 => nil,
    6 => [Pawn]*8,
    7 => [Rook,Knight,Bishop,King,Queen,Bishop,Knight,Rook]
  }
  COLORS = [:white, :black]


  attr_reader :grid
  def initialize
    @grid = make_starting_grid
  end

  def make_starting_grid
    chess = Array.new(8)
    chess.each_index do |index_row|
      chess[index_row] = row_pieces(PIECES_BY_INDEX[index_row],index_row,color_by_index(index_row))
    end
    chess
  end

  def color_by_index(index)
    index < 2 ? COLORS[0] : COLORS[1]
  end

  def row_pieces(pieces, index_row, color)
    return Array.new(8){NullPiece.instance} if pieces.nil?

    chess_row = []
    pieces.each_with_index do |piece, index_column|
      chess_row << piece.new([index_row, index_column], self, color)
    end
    chess_row
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos,value)
    x, y = pos
    @grid[x][y] = value
  end

  def in_bounds?(pos)
    x, y = pos
    x < 8 && y < 8 &&
    x >= 0 && y >= 0
  end

  def move_piece(start_pos,end_pos)
    unless in_bounds?(start_pos) && in_bounds?(end_pos)
      raise ArgumentError.new("one of those spaces isn't on the grid!")
    end
    if self[start_pos].nil?
      raise ArgumentError.new("no piece in the start position")
    end

    piece = self[start_pos]
    self[start_pos] = nil
    self[end_pos] = piece
    piece.position = end_pos


  end

  def prompt_user
    puts "Which piece should I move"
    start_pos = gets.chomp.split(",").map(&:to_i)
    puts "Where should I put it"
    end_pos = gets.chomp.split(",").map(&:to_i)
    move_piece(start_pos,end_pos)
  rescue ArgumentError => e
    puts "#{e.message}\n"
    retry
  rescue NoMethodError => e
    puts "Invalid input\n"
    retry
  end



end
