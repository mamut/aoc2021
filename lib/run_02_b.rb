require './lib/submarine2'

commands = File.read('./data/02a/data.txt').split("\n").map do |line|
  command, value = line.split(' ')
  [command.to_sym, value.to_i]
end

initial_state = {
  horizontal: 0,
  depth: 0,
  aim: 0,
}

submarine = Submarine2.new

result = submarine.run(initial_state, commands)

pp result
