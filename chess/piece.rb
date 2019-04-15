class Piece
    attr_accessor :position, :symbol
    def initialize(position)
        @position = position
        @symbol = "O"
    end
end

class NullPiece < Piece

    def initialize(position)
        super
        @symbol = "X"
    end
end