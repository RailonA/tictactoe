
require './lib/board_info'
require './lib/player_info'
require './lib/game_logic'


test_player = PlayerInfo.new 
test_board = BoardInfo.new
 "Ray" = test_player()
describe TicTacToe do 
 
    describe "#player_info" do
    it "Check all valid cases" do  
        expect().to eql(test_player) 
        expect("name").to eql(player_info)  
    end
     it " Check for invalid cases" do 
        # expect("Ray").to eql(player_info)   
    end
      
    end

end

tictactoe = TicTacToe.new
