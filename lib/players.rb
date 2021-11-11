
class Players
    attr_accessor :player_one, :player_two
  
    def initialize(player_icon)
      @player_one = verify_player
      @player_two = verify_player
    end
    
      def verify_player
        until ('a'..'z').include?(player_icon = gets.chomp) || ('A'..'Z').include?(player_icon) && player_icon.length == 1
            puts 'You put a invalid character. Enter a single letter character'
          end
          return player_icon
        end  
  end
  