require "byebug"

module Slideable
    CARDINAL_DIRS = {
        left: [0, -1],
        right: [0, 1],
        up: [-1, 0],
        down: [1, 0]
}
    DIAGONAL_DIRS = { 
        up_left: [-1, -1], 
        up_right: [-1, 1], 
        down_left: [1, -1], 
        down_right: [1, 1]
}

    def card_dirs(start_pos, dir)
        directions_array = CARDINAL_DIRS[dir]
        temp_pos = Array.new(2)
        temp_pos.each.with_index do |value,i|
            temp_pos[i] = start_pos[i] + directions_array[i]
        end
        temp_pos 
    end

    def dia_dirs(start_pos, dir)
        directions_array = DIAGONAL_DIRS[dir]
        temp_pos = Array.new(2)
        temp_pos.each.with_index do |value,i|
            temp_pos[i] = start_pos[i] + directions_array[i]
        end
        temp_pos             
    end

    

    def grow_unblocked_moves_in_dir(dx,dy, position)
        

        directions = [dx,dy]

            if directions.include?(0)
                temp_pos = card_dirs(position, CARDINAL_DIRS.key(directions))
            else
                temp_pos = dia_dirs(position, DIAGONAL_DIRS.key(directions))
            end
            
            if !valid_pos?(temp_pos)


            elsif !@board[temp_pos].is_a?(NullPiece)
                if self.color == @board[temp_pos].color

                else
                    self.possible_future_moves << temp_pos

                end
            else    
                self.possible_future_moves << temp_pos
                grow_unblocked_moves_in_dir(dx,dy, temp_pos)
            end        
    end

    def valid_pos?(pos)
        if pos[0] < 0 || pos[0] > 7 || pos[1] < 0 || pos[1] > 7
            false
        else
            true
        end
    end

end
#board[[0,0]].grow_unblocked_moves_in_dir(1,0,board[[0,0]].position)