require_relative '../lib/tic_tac_toe'

describe GameBoard do
    describe "#player_move" do
    subject(:board) { described_class.new(['a', 1, 2, 3, 4, 5, 6, 7,])}
    context "changes board spot to input" do
        it "changes board position to value" do 
        player_symbol = "t"
        position = 2
        expect(board.board[position]).to eql("t")
        board.player_move(position, player_symbol)
    end
end
    context "expect error message on wrong input" do
        player_symbol = "t"
        position = 20
        error_message = "position is not available. Choose a open position on the board"
        it "displays error message on wrong input" do
        expect(board).to receive(:puts).with(error_message)
        board.player_move(position, player_symbol)
    end
end
end
end