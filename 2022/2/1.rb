# frozen_string_literal: true

class Game
  attr_reader :game_hash, :file

  def initialize(file)
    @file = file
    @game_hash = {
      A: "rock",
      B: "paper",
      C: "scissors",
      X: "rock",
      Y: "paper",
      Z: "scissors"
    }
    @game_points = { rock: 1, paper: 2, scissors: 3 }
  end

  def call
    score = 0
    to_game_hash.each do |opponent, player|
      score += if tie(opponent, player)
        3
      elsif win(opponent, player)
        6
      else
        0
      end
      score += @game_points[player]
    end
    puts score
  end

  private

  def lines
    file.split("\n")
  end

  def to_game_hash
    lines.map do |line|
      line.split.map { |letters| game_hash[letters.to_sym] }
    end
  end

  def tie(opponent, player)
    player == opponent
  end

  def win(opponent, player)
    (player == "rock" && opponent == "scissors") ||
      (player == "paper" && opponent == "rock") ||
      (player == "scissors" && opponent == "paper")
  end
end

Game.new(File.read("file")).call
