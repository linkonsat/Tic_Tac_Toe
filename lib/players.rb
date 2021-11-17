
class Players
    attr_accessor :player, :player_icon
  
    def initialize
      @player = nil
      @player_icon = nil
    end

    def assign_player
        @player_icon = verify_player
    end
      def verify_player
        until ('a'..'z').include?(player_icon = gets.chomp) || ('A'..'Z').include?(player_icon) && player_icon.length == 1
            puts 'You put a invalid character. Enter a single letter character'
          end
          return player_icon
        end  

  end
  

