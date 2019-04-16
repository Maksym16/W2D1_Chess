require "colorize"
require "byebug"
require_relative "cursor.rb"
require_relative "board.rb"
require_relative "piece.rb"

class Display
    def initialize(board)
        @board = board
        @cursor = Cursor.new([0, 0], @board)
    end

    def render
        system("clear")
        print "  #{(0..7).to_a.join(' ')} \n"
        @board.grid.each_with_index do |row, i|
            
            row_string = "#{i} "
            (0..7).each do |i2|
                if @cursor.cursor_pos == [i, i2]
                    if @cursor.selected == false
                        row_string += "#{row[i2].symbol} ".colorize(:blue)
                    else
                        row_string += "#{row[i2].symbol} ".colorize(:red)
                    end
                else
                    row_string += "#{row[i2].symbol} "
                end
            end
            print row_string + "\n"
        end
        return nil
    end
  
    def render_loop
        game_over = false
        while game_over == false
            self.render
            p @cursor.cursor_pos
            @cursor.get_input
        end
    end

end

board = Board.new
display = Display.new(board)
display.render_loop