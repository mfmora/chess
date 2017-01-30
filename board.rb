require_relative 'piece.rb'
require 'byebug'
class Board
  attr_reader :grid
  def initialize
    @grid = make_starting_grid
  end

  def make_starting_grid
    chess = Array.new(8)
    chess.each_index do |index_row|
      if index_row <= 1 || index_row >= 6
        chess_row = []
        (0...8).each do |column_row|
          chess_row << Piece.new([index_row,column_row])
        end
        chess[index_row] = chess_row
      else
        chess[index_row] = Array.new(8){nil}
      end
    end
    chess
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
    x < 8 && y < 8
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
