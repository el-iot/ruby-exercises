# frozen_string_literal: true

class Game
  attr_reader :finished
  def initialize
    @finished = false
    @code = 'ABCDE'
    @turn = 1
    puts 'Welcome to Mastermind!'
  end

  def play
    guess = prompt
    n = match(guess)
    puts "You got #{n} correct!"
    puts 'You win!' if n == 5
    @turn += 1
    @finished = true if (n == 5) || (@turn == 12)
  end

  def prompt
    loop do
      error, guess = get_guess
      puts 'Error: bad guess format' if error
      return guess[1] unless error
    end
  end

  def match(guess)
    count = 0
    (0...5).each do |idx|
      count += 1 if guess[idx] == @code[idx]
    end
    count
  end

  def get_guess
    puts "Round #{@turn}: What is your guess?"
    match = gets.chomp.upcase.match(/^([ABCDE]{5})$/)
    [!match, match]
  end
end

game = Game.new
game.play until game.finished
