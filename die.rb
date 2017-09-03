# require_relative 'runner'

class Die
 attr_reader :side_count, :die

  def initialize(side_count = 6, die = 0)
    @side_count = side_count
    @die = die
  end

  def roll
    # rand(n) will return a number from 0 to one less than n
    @die = rand(side_count) + 1
  end
end

