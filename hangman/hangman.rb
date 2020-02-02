# frozen_string_literal: true

require 'csv'

class Game
  def initialize(load_game = false)
    if load_game
      puts 'Not Implemented'
      @word = 'beans'
    else
      words = File.readlines('words.txt')
      @word = words[rand(words.length)]
    end
    @found = Set.new
    @missed = Set.new
    @guesses_left = 10
  end

  def prompt; end

  def guess(letter); end
end

game = Game.new
