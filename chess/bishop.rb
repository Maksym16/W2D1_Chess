require_relative "piece"
require_relative "slideable"

class Bishop < Piece
    include Slideable
    def initialize(pos, board, color)
        super
        @symbol = "B"
    end

    def find_possible_moves
        directions = [[1,1],[1,-1],[-1,1],[-1,-1]]
        directions.each do |ele|
            grow_unblocked_moves_in_dir(ele[0], ele[1],position)
        end
    end

end
