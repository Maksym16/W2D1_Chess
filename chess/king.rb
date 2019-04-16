require_relative "piece"
class King < Piece
    def initialize(pos, board, color)
        super
        @symbol = "*"
    end

end