require_relative "piece_load"
require "byebug"
class Board 

    attr_reader :grid
    def initialize
        @sentinel = NullPiece.instance
        @grid = Array.new(8) {Array.new(8, @sentinel)}
        #@empty_piece = NullPiece.new(0, @grid, "black")
        populate_board
    end

    def populate_board
        (0..7).each do |idx1|
            (0..7).each do |idx2|
                if [0, 1].include?(idx1)
                    if idx1 == 1
                        #@grid[idx1][idx2] = Pawn.new([idx1, idx2], @grid, "White")
                    else
                        if idx2 == 0 || idx2 == 7
                            @grid[idx1][idx2] = Rook.new([idx1, idx2], self, "White")
                        elsif idx2 == 1 || idx2 == 6
                            @grid[idx1][idx2] = Bishop.new([idx1, idx2], self, "White")
                        elsif idx2 == 2 || idx2 == 5
                            @grid[idx1][idx2] = Knight.new([idx1, idx2], self, "White")
                        elsif idx2 == 3
                            @grid[idx1][idx2] = Queen.new([idx1, idx2], self, "White")
                        else
                            @grid[idx1][idx2] = King.new([idx1, idx2], self, "White")
                        end
                    end
                elsif [6, 7].include?(idx1)
                    if idx1 == 6
                        @grid[idx1][idx2] = Pawn.new([idx1, idx2], self, "Black")
                    else
                        if idx2 == 0 || idx2 == 7
                            @grid[idx1][idx2] = Rook.new([idx1, idx2], self, "Black")
                        elsif idx2 == 1 || idx2 == 6
                            @grid[idx1][idx2] = Bishop.new([idx1, idx2], self, "Black")
                        elsif idx2 == 2 || idx2 == 5
                            @grid[idx1][idx2] = Knight.new([idx1, idx2], self, "Black")
                        elsif idx2 == 3
                            @grid[idx1][idx2] = Queen.new([idx1, idx2], self, "Black")
                        else
                            @grid[idx1][idx2] = King.new([idx1, idx2], self, "Black")
                        end
                    end
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

