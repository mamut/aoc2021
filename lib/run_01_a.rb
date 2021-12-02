require './lib/day_01_a'

data = File.read('./data/01a/data.txt').split("\n").map(&:to_i)

day = Day01A.new(data: data)
pp day.run
