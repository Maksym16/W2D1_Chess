require "singleton"
class Piece
    attr_reader :color, :symbol
    attr_accessor :position, :possible_future_moves
    def initialize(position, board, color)
        @position = position
        @symbol = "O"
        @board = board
        @color = color
        @possible_future_moves = []
    end

    def to_s
        @symbol.to_s
    end

    def empty?
        if self.color == color
        end

    end
    def valid_moves
        if pos[0] < 0 || pos[0] > 7 || pos[1] < 0 || pos[1] > 7
            false
        else
            true
        end
    end


    def pos=(val)
        @position = val
    end

   private
    def move_into_check?(end_pos)

    end
end

class NullPiece < Piece
    include Singleton
    def initialize
        @color = "grey"
        @symbol = "-"
    end
end
