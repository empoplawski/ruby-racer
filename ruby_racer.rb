require_relative 'die'

class RubyRacer
  attr_reader :players, :die, :length, :player_positions

  def initialize(players, die, length=30)
    @player_position = 0
    @length = length
    @players = players
    @die = die
    @player_positions = Hash[@players.map { |key| [key, 0]}]
    @board = []

  end

  # Returns +true+ if one of the players as reached
  # the finish line, +false+ otherwise
  def finished?
    player_positions.any? { |player, position| position >= length}
  end

  # Returns the winner if there is one, +nil+ otherwise
  def winner
    @player_positions.max_by{|player, position| position}[0]
  end

  # Rolls the die and advances +player+ accordingly
  def advance_player
    @player_positions.map do |player, position|
      position += die.roll
      @player_positions[player] = calculate_player_position(position)
    end
  end

  def calculate_player_position(position)
    if position > length
      length
    else 
      position
    end
  end

  # Returns the current state of the game as a string
  # that can be printed on the command line.
  # The board should have the same dimensions each time.
  def board_visualization

    tracks = player_positions.collect { |player, position| player_on_track(position, player).join(" |") }
      puts tracks.join("\n")

  end

  def track
    Array.new(length,"")
  end

  def player_on_track(position, player)

    location = track
    # require 'pry'
    # binding.pry
    location[position] = player
    location
  end

end



die = Die.new
game = RubyRacer.new([:a, :b], die)

# game.board_visualization
# game.advance_player
# game.board_visualization
# game.advance_player
# game.board_visualization
# game.advance_player
# game.board_visualization
# game.board_visualization
# game.advance_player
# game.board_visualization
# game.advance_player
# game.board_visualization
# game.advance_player
# game.board_visualization

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
