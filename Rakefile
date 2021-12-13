require 'rake/testtask'

require './lib/day_01_a'
require './lib/day_01_b'

require './lib/submarine'
require './lib/submarine2'

require './lib/diagnostic'

require './lib/bingo'

task default: "test"

Rake::TestTask.new do |task|
 task.pattern = "test/*_test.rb"
end

desc 'Sonar'
task :day01 do
  data = File.read('./data/01a/data.txt').split("\n").map(&:to_i)

  day01a = Day01A.new(data: data)
  day01b = Day01B.new(data: data)

  pp day01a.run
  pp day01b.run
end

desc 'Submarine'
task :day02 do
  commands = File.read('./data/02a/data.txt').split("\n").map do |line|
    command, value = line.split(' ')
    [command.to_sym, value.to_i]
  end

  initial_state = {
    horizontal: 0,
    depth: 0,
    aim: 0,
  }

  submarine = Submarine.new
  submarine2 = Submarine2.new

  pp submarine.run(initial_state, commands)
  pp submarine2.run(initial_state, commands)
end

desc 'Diagnostic'
task :day03 do
  data = File.read('./data/03a/data.txt').split("\n")

  diagnostic = Diagnostic.new(data)

  pp diagnostic.power_consumption
  pp diagnostic.life_support_rating
end

desc 'Bingo'
task :day04 do
  content = File.read('./data/04a/data.txt')
  chunks = content.split("\n\n")

  numbers = chunks.shift.split(",").map(&:to_i)
  data = chunks.join("\n\n")

  bingo = Bingo.load(data, numbers)
  win = bingo.win
  lose = bingo.lose

  pp win.final_score
  pp lose.final_score
end
