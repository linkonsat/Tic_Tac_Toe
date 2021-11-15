require_relative '../lib/gameboard'

describe GameBoard do
    describe "#verify_input" do
    subject(:board) { described_class.new(['a', 1, 2, 3, 4, 5, 6, 7])}
    context "returns input on correct input" do
        before do 
            allow(board).to receive(:gets).and_return("5")
        end
        it "assings position a number on correct input" do 
        board.player_move
        expect(board.position).to eql(5)
    end
end
    context "expect position to not be assigned to a wrong input" do
        before do 
            allow(board).to receive(:gets).and_return("10","5")
        end
        it "does not assign position until correct input" do
       board.player_move
        expect(board.position).to eql(5)     
    end
end
end
    describe "#change_board" do
    subject(:board) {described_class.new(["a", 1, 2, 3, 4, 5, 6, 7])}
    context "changes board position on correct placement" do
    it "changes board position to correct player symbol" do
        position = 5
        player_symbol = "t"
        board.change_board(position,player_symbol)
        expect(board.board[position]).to eql("t")
    end
end
end

    describe "#verify_input" do 
    subject(:board) {described_class.new(["a", 1, 2, 3, 4, 5, 6, 7])}
    before do
        allow(board).to receive(:gets).and_return("5")
    end
    it "tests verify input for proper return val" do 
        result = board.player_move
        expect(board.position).to eql(5)
    end
end
end