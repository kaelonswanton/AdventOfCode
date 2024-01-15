# game_hash = {A: 'rock', B: 'paper', C: 'scissors', X: 'rock', Y: 'paper', Z: 'scissors'}
# points = {'rock' => 1, 'paper' => 2, 'scissors' => 3}

# lines = File.read('file').split("\n") #split into an array of strings
# to_game_hash = lines.map do |line|
#   line.split #split each line into an array of letters
#   .map { |letters| game_hash[letters.to_sym]} #iterate over each array, match with game_hash
# end #game_hash[letter.to_sym] turns each letter in the array to a symbol, looks for the symbol in the hash, then returns its value

# score = 0
# to_game_hash.each do |opponent, player|
#   if player == opponent
#     score += 3
#   elsif player == 'rock' && opponent == 'scissors' || player == 'paper' && opponent == 'rock' || player == 'scissors' && opponent == 'paper'
#     score += 6
#   else
#     score += 0
#   end
#   score += points[player]
# end
# puts score

class Game
  attr_reader :game_hash, :points

  def initialize(file)
    @file = File.read(file).split("\n")
    @game_hash = {A: 'rock', B: 'paper', C: 'scissors', X: 'rock', Y: 'paper', Z: 'scissors'}
    @game_points = {'rock' => 1, 'paper' => 2, 'scissors' => 3} 
  end

  def call
    score = 0
    to_game_hash.each do |opponent, player|
      if player == opponent
        score += 3
      elsif player == 'rock' && opponent == 'scissors' || player == 'paper' && opponent == 'rock' || player == 'scissors' && opponent == 'paper'
        score += 6
      else
        score += 0
      end
      score += @game_points[player]
    end
    puts score
  end

  private
  def to_game_hash
    @file.map do |line|
      line.split.map { |letters| game_hash[letters.to_sym] }
    end
  end
end

Game.new('file').call
