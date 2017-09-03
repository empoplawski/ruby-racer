require_relative 'die'

class RubyRacer
  attr_reader :players, :die, :length

  def initialize(players, die, length = 30)
    @player_a_position = 0
    @player_b_position = 0
    @length = length
    @players = [:a, :b]
    @die = die
  end

  # Returns +true+ if one of the players has reached
  # the finish line, +false+ otherwise
  def finished?
  end

  # Returns the winner if there is one, +nil+ otherwise
  def winner
  end

  # Rolls the die and advances +player+ accordingly
  def advance_player
      @player_a_position += die.roll
      @player_b_position += die.roll
  end

  # Returns the current state of the game as a string
  # that can be printed on the command line.
  # The board should have the same dimensions each time.
  def board_visualization
    # game.players.each do |player|
    #   game.advance_player(player)
    # end
    player_a_track = Array.new(@length) { [' ', '|'] }
    player_b_track = Array.new(@length) { [' ', '|'] }

    player_a_track[@player_a_position][0] = 'a'
    player_b_track[@player_b_position][0] = 'b'

    complete_track = [player_a_track.join, player_b_track.join]
  end
end

die = Die.new

game = RubyRacer.new("asdf", die)

# puts game.board_visualization
# p game.advance_player
# p @player_a_position
p game.advance_player
# p @player_a_position
# p die.roll
