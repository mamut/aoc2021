require './lib/diagnostic'

data = File.read('./data/03a/data.txt').split("\n")

diagnostic = Diagnostic.new(data)

pp diagnostic.power_consumption
