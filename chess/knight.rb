require_relative "piece"
class Knight < Piece
    def initialize(pos, board, color)
        super
        @symbol = "K"
    end

end