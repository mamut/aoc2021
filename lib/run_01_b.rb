require './lib/day_01_b'

data = File.read('./data/01a/data.txt').split("\n").map(&:to_i)

day = Day01B.new(data: data)
pp day.run
