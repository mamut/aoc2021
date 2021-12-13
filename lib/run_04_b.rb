require './lib/bingo'

content = File.read('./data/04a/data.txt')
chunks = content.split("\n\n")

numbers = chunks.shift.split(",").map(&:to_i)
data = chunks.join("\n\n")

bingo = Bingo.load(data, numbers)
lose = bingo.lose

pp lose.final_score
