#we want to test the tie method by seeing if there is no numberic values it returns nil
#Then we can do one test of a diagon,vertical and then x style win
require_relative "../lib/game_result"

describe GameResult do
    describe "#tie" do
    subject(:result) { described_class.new() }
    context "returns true if there is no winning condition" do
        it "returns true if no spots remain on the board" do
            outcome = result.tie(["a","a","b","a","a","b","b","b","a","b"])
            expect(outcome).to eql(true)
        end
    end

    describe "#win" do 
    subject(:result) { described_class.new() }
    context "returns a win on vertical,diagonal, and cross board of all player symbols" do
        it "returns true on a valid win" do 
            expect(result.win(["a","a","a","a",4, 5, 6, 7,8],"a")).to eql(true)
            expect(result.win(["a","a",2,3,"a",5,6,"a",8],"a")).to eql(true)
            expect(result.win(["a",1,2,3,"a",5,6,7,"a"],"a")).to eql(true)
        end
    end

    context "returns false on no winning condition" do 
        it "returns false on no winning conditions" do
            expect(result.win(["t","t","t","t","t","t","t","t","t"],"a")).to eql(nil)
        end
    end
end
end

end