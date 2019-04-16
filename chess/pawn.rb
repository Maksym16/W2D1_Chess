require_relative "piece"
class Pawn < Piece
    def initialize(pos, board, color)
        super
        @symbol = "p"
    end

end