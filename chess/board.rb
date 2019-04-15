require_relative "piece"
require "byebug"
class Board 

    attr_reader :grid
    def initialize
        

        @grid = Array.new(8) {Array.new(8)}
        @empty_piece = NullPiece.new(0)
         (0..7).each do |idx1|
            (0..7).each do |idx2|
                if [0, 1, 6, 7].include?(idx1)
                    @grid[idx1][idx2] = Piece.new([idx1, idx2])
                else
                    @grid[idx1][idx2] = @empty_piece
                end
            end
        end
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, value)
        row, col = pos
        @grid[row][col] = value
    end

    def move_piece(start_pos, end_pos)
        unless valid_move(end_pos)
            raise "That space isn't on the board"
        end
        
        unless self[end_pos].is_a?(NullPiece)
            raise "There's a piece there already"
        end

        if self[start_pos].is_a?(Piece)
            self[end_pos] = self[start_pos]
            self[start_pos] = @empty_piece
        else
            raise "There isn't a piece here"
        end


    end

    def valid_move(pos)
        if pos[0] < 0 || pos[0] > 7 || pos[1] < 0 || pos[1] > 7
            false
        else
            true
        end
    end


end

