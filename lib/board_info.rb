
class BoardInfo


   attr_accessor :memory, :player_board
   
   
   def initialize
       
    @memory = Array.new(9, ' ')
    (1..9).each do |i|
    @memory[i - 1] = i
    end

    @player_board = Array.new(9, ' ')
    (1..9).each do |i|
    @player_board[i - 1] = ' '
    end

  end


  # def board_update
  #   unless @@error_input
  #     @@memory[@@location.to_i - 1] = ' '
  #     @@player_board[@@location.to_i - 1] = @@current_player[:symbol]
  #   end
  # end

end
