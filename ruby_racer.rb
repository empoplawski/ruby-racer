require_relative 'die'

class RubyRacer
  attr_reader :players, :die, :length, :player_positions

  def initialize(players, die, length=30)
    @player_position = 0
    @length = length
    @players = players
    @die = die
    @player_positions = Hash[@players.map { |key| [key, 0]}]
  end

  # Returns +true+ if one of the players has reached
  # the finish line, +false+ otherwise
  def finished?
    @player_positions.each do |player, position|
      return true if position >= @length
    end
      false
  end

  # Returns the winner if there is one, +nil+ otherwise
  def winner
    @player_positions.max_by{|player, position| position}[0]
  end

  # Rolls the die and advances +player+ accordingly
  def advance_player
    @player_positions.map do |player, position|
      @player_position += die.roll
      @player_positions[player] = @player_position
    end
  end

  # Returns the current state of the game as a string
  # that can be printed on the command line.
  # The board should have the same dimensions each time.
  def board_visualization
    board = Array.new

    # @players.each do |player|
    #   track = Array.new(@length) { [' ', '|'] }
    #   track[@player_position] = player
    #   board << track
    # end

    @player_positions.each do |player, position|
      track = Array.new(@length) { [' ', '|'] }
      track[@player_positions[player]] = player
      board << track
    end

    board.each { |track| puts track.join}
  end
end

die = Die.new
game = RubyRacer.new([:a, :b], die)

game.board_visualization
game.advance_player
game.board_visualization
game.advance_player
game.board_visualization
game.advance_player
game.board_visualization
game.board_visualization
game.advance_player
game.board_visualization
game.advance_player
game.board_visualization
game.advance_player
game.board_visualization

# p @player_a_position
# p game.advance_player
# p @player_a_position
# p die.roll

# p game.player_positions
# p game.advance_player
# p game.player_positions
# p game.advance_player
# p game.player_positions
# p game.advance_player
# p game.player_positions
# p game.finished?
