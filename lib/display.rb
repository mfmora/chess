require 'colorize'
require_relative 'cursor.rb'
require_relative 'board.rb'
class Display

  COLORS = {
    selected: :magenta,
    even: :light_white,
    odd: :light_black
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

        piece_color = {background: back_color([row_index,column_index])}
        selected_color = {background: COLORS[:selected]}

        if @cursor.cursor_pos == [row_index,column_index]
          print " #{printed} ".colorize(selected_color)
        else
          print " #{printed} ".colorize(piece_color)
        end
      end
      puts " \n"
    end
    puts " \n"
  end

  def back_color(position)
    position.inject(:+) % 2 == 0 ? COLORS[:even] : COLORS[:odd]
  end

  def move(times = 10)
    while times > 0
      @cursor.get_input
      render
      times -= 1
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  board = Board.new
  display = Display.new(board)
end
