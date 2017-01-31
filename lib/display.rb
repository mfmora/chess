require 'colorize'
require_relative 'cursor.rb'
require_relative 'board.rb'
class Display

  COLORS = {
    color: :white,
    background: :cyan,
    selected: :magenta
  }

  attr_reader :cursor
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0],@board)
  end

  def render
    system("clear")
    @board.grid.each_with_index do |row, row_index|
      row.each_with_index do |piece, column_index|
        printed = piece.is_a?(NullPiece) ? " " : "#{piece.to_s}"

        piece_color = {color: piece.color, background: COLORS[:background]}
        selected_color = {color: piece.color, background: COLORS[:selected]}

        if @cursor.cursor_pos == [row_index,column_index]
          print "|".colorize(COLORS) +
          " #{printed} ".colorize(selected_color)
        else
          print "|".colorize(COLORS) +
          " #{printed} ".colorize(piece_color)
        end
      end
      print "|".colorize(COLORS)
      puts " \n"
      puts "---------------------------------".colorize(COLORS)
    end
    puts " \n"
  end

  def move(times = 10)
    while times > 0
      @cursor.get_input
      render
      times -= 1
    end
  end
end
