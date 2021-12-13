require 'rake/testtask'

Dir["./lib/*.rb"].each { |file| require file }

task default: "test"

Rake::TestTask.new do |task|
 task.pattern = "test/test_*.rb"
end

desc 'Sonar'
task :day01 do
  data = File.read('./data/01.txt').split("\n").map(&:to_i)

  sonar1 = Sonar.new(data: data)
  sonar2 = Sonar2.new(data: data)

  pp sonar1.run
  pp sonar2.run
end

desc 'Submarine'
task :day02 do
  commands = File.read('./data/02.txt').split("\n").map do |line|
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
  data = File.read('./data/03.txt').split("\n")

  diagnostic = Diagnostic.new(data)

  pp diagnostic.power_consumption
  pp diagnostic.life_support_rating
end

desc 'Bingo'
task :day04 do
  content = File.read('./data/04.txt')
  chunks = content.split("\n\n")

  numbers = chunks.shift.split(",").map(&:to_i)
  data = chunks.join("\n\n")

  bingo = Bingo.load(data, numbers)
  win = bingo.win
  lose = bingo.lose

  pp win.final_score
  pp lose.final_score
end

desc 'Vents'
task :day05 do
  data = File.read('./data/05.txt')
  vents = Vents.new(data)

  pp vents.nr_of_city_overlaps
  pp vents.nr_of_overlaps
end

desc 'Lanternfish'
task :day06 do
  data = File.read('./data/06.txt')

  colony = Lanternfish::Colony.from(data)
  lanternfish = Lanternfish.new(colony)

  pp lanternfish.days(80).count
  pp lanternfish.days(256).count
end

desc 'Crabs'
task :day07 do
  data = File.read('./data/07.txt')
  crabs1 = Crabs.from(data)
  crabs2 = Crabs2.from(data)

  pp crabs1.least_fuel
  pp crabs2.least_fuel
end
