require 'colorize'
require_relative 'cursor.rb'
require_relative 'board.rb'
class Display
  attr_reader :cursor
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0],@board)
  end

  def render
    @board.grid.each_with_index do |row, row_index|
      row.each_with_index do |piece, column_index|
        printed = piece.nil? ? " " : "#{piece.to_s}"

        if @cursor.cursor_pos == [row_index,column_index]
          print "|" + " #{printed} ".white.on_magenta
        else
          print "| #{printed} "
        end
      end
      puts "|\n"
      puts "--------------------------------"
    end
  end

  def move(times = 10)
    while times > 0
      @cursor.get_input
      render
      times -= 1
    end
  end
end
