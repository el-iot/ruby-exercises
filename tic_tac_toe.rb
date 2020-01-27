# frozen_string_literal: true

require 'set'

class Board
  def initialize
    @board = [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]
  end

  def rows
    @board
  end

  def columns
    output = [[], [], []]
    @board.each do |row|
      (0...3).each do |idx|
        output[idx].push(row[idx])
      end
    end
    output
  end

  def diagonals
    [
      [
        @board[0][0],
        @board[1][1],
        @board[2][2]
      ],
      [
        @board[0][2],
        @board[1][1],
        @board[2][0]
      ]
    ]
  end

  def at(row, col)
    @board[row][col]
  end

  def set(row, col, value)
    @board[row][col] = value
  end

  def finished?
    rows.each do |row|
      return true if row.to_set.length == 1 && row.none?(&:nil?)
    end
    columns.each do |column|
      return true if column.to_set.length == 1 && column.none?(&:nil?)
    end
    diagonals.each do |diagonal|
      return true if diagonal.to_set.length == 1 && diagonal.none?(&:nil?)
    end
    false
  end
end

class Game
  def initialize
    @current_player = 1
    @board = Board.new
  end

  def prompt_move
    loop do
      puts "Player #{display_player}: Where would you like to play next?"
      match = gets.chomp.match(/^(\d),*\s*(\d)$/)
      return match[1..2].map(&:to_i) if match && valid?(match)

      puts 'Error, bad move format!'
    end
  end

  def display_player
    return 1 if @current_player == 1

    2
  end

  def valid?(match)
    r, c = match[1..2].map(&:to_i)
    (r >= 0 && r <= 2 && c >= 0 && c <= 2 && @board.at(r, c).nil?)
  end

  def play_move
    r, c = prompt_move
    @board.set(r, c, @current_player)
    render_board
    @current_player = -@current_player
  end

  def render_board
    @board.rows.each do |row|
      print(row.map { |e| render_element(e) }.join(' | '))
      puts
    end
  end

  def render_element(element)
    {
      -1 => 'X',
      1 => 'O',
      nil => '-'
    }[element]
  end

  def play
    play_move until @board.finished?
    puts 'Finished!'
  end
end

game = Game.new
game.play
